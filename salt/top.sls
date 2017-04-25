base:
  '*':
    - repositories
    - motd
    - users
  'roles:ca':
    - match: grain
    - ca
  'roles:kube-(master|minion)':
    - match: grain_pcre
    - cert
    - etcd-proxy
  'roles:kube-master':
    - match: grain
    - kubernetes-master
    - flannel
    - docker
    - reboot
    - hosts-master
  'roles:kube-minion':
    - match: grain
    - flannel
    - docker
    - kubernetes-minion
    - hosts-minion
