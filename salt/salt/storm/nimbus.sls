include:
  - storm

storm-nimbus:
  supervisord.running:
    - name: nimbus
    - require:
      - sls: storm

storm-drpc:
  supervisord.running:
    - name: drpc
    - require:
      - sls: storm

storm-ui:
  supervisord.running:
    - name: ui
    - require:
      - sls: storm
