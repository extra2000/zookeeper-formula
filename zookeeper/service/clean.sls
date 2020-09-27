# -*- coding: utf-8 -*-
# vim: ft=sls

zookeeper-service-dead:
  service.dead:
    - name: zookeeper.service
    - enable: false
