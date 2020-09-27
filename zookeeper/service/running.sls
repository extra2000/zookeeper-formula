# -*- coding: utf-8 -*-
# vim: ft=sls

zookeeper-service-running:
  service.running:
    - name: zookeeper.service
    - enable: true
