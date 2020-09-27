# -*- coding: utf-8 -*-
# vim: ft=sls

zookeeper-config-file-present:
  file.managed:
    - name: /opt/apache-zookeeper-{{ pillar['zookeeper']['version'] }}-bin/conf/zoo.cfg
    - source: salt://zookeeper/files/zoo.cfg.jinja
    - template: jinja
    - force: true

zookeeper-systemd-service-present:
  file.managed:
    - name: /etc/systemd/system/zookeeper.service
    - source: salt://zookeeper/files/zookeeper.service.jinja
    - template: jinja
    - force: true

zookeeper-systemd-reload:
  cmd.run:
   - name: systemctl daemon-reload
   - onchanges:
     - file: zookeeper-systemd-service-present
