{% if salt['pillar.get']('helm:helm_version', '') != '' -%}
get_helm:
  archive.extracted:
    - name: /tmp
    - source: https://kubernetes-helm.storage.googleapis.com/helm-{{pillar['helm']['helm_version'] }}-linux-amd64.tar.gz
    - skip_verify: True
    - overwrite: True

{% if salt['pillar.get']('helm:tiller_image', '') != '' -%}
image_options:
   environ.setenv:
     - name: IMAGE_OPTIONS
     - value: "--tiller-image {{pillar['helm']['tiller_image'] }}"
     - update_minion: False
{% endif -%}
tiller_install:
  cmd.run:
    - name: /tmp/linux-amd64/helm init $IMAGE_OPTIONS

remove_helm:
   file.absent:
      - name: /tmp/linux-amd64
{% endif -%}
