# -*- coding: utf-8 -*-
# vim: ft=sls

zookeeper-group-present:
  group.present:
    - name: {{ pillar['zookeeper']['group'] }}

zookeeper-user-present:
  user.present:
    - name: {{ pillar['zookeeper']['user'] }}
    - groups:
      - {{ pillar['zookeeper']['group'] }}

zookeeper-binaries-present:
  archive.extracted:
    - name: /opt
    - source: {{ pillar['zookeeper']['archive']['source'] }}
    - source_hash: {{ pillar['zookeeper']['archive']['sha512'] }}
    - user: {{ pillar['zookeeper']['user'] }}
    - group: {{ pillar['zookeeper']['group'] }}

zookeeper-binaries-owner:
  file.directory:
    - name: /opt/apache-zookeeper-{{ pillar['zookeeper']['version'] }}-bin
    - user: {{ pillar['zookeeper']['user'] }}
    - group: {{ pillar['zookeeper']['group'] }}
    - recurse:
      - user
      - group
    - require:
      - archive: zookeeper-binaries-present
