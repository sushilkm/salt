base:
  '*':
    - repositories
{% if pillar.get('avahi', '').lower() == 'true' %}
    - avahi
{% endif %}
    - motd
    - users
{% if salt['pillar.get']('infrastructure', 'libvirt') == 'cloud' %}
    - hosts
{% endif %}
  'roles:ca':
    - match: grain
    - ca
  'roles:etcd':
    - match: grain
    - cert
    - etcd
  'roles:kube-master':
    - match: grain
    - cert
    - etcd-proxy
    - kubernetes-master
  'roles:kube-minion':
    - match: grain
    - cert
    - etcd-proxy
    - kubernetes-minion
    - docker
    - flannel
    - sle
  'roles:nfs':
    - match: grain
    - nfs-server
  'roles:haproxy':
    - match: grain
    - confd
    - haproxy
