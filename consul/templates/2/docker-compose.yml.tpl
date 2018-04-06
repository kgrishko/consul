consul-base:
  image: consul:1.0.6
  entrypoint:
    - /opt/rancher/bin/start_consul.sh
  net: "container:consul"
  labels:
    io.rancher.container.hostname_override: container_name
  volumes_from:
    - consul-data
consul-data:
  image: alpine:latest
  entrypoint:
    - /bin/true
  labels:
    io.rancher.container.hostname_override: container_name
    io.rancher.container.start_once: true
  volumes:
    - /var/consul
    - /opt/rancher/bin
    - /opt/rancher/ssl
    - /opt/rancher/config
  net: none

