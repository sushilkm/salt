{%- for minion_id, addrlist in salt['mine.get']('roles:kube-master', 'network.ip_addrs', 'grain').items() %}
{{ minion_id }}-host-entry:
  host.present:
{% if addrlist is string %}
    - ip: {{ addrlist }}
{% else %}
    - ip: {{ addrlist|first }}
{% endif %}
    - names:
      - api
      - api.{{ pillar['internal_infra_domain'] }}
      - {{ minion_id }}
      - {{ minion_id }}.{{ pillar['internal_infra_domain'] }}
{% endfor %}
