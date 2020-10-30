#!/bin/sh

set -e

start.sh ray start \
  --head \
  --node-ip-address $(hostname -I) \
  --port {{ engines.ray_jupyter.vars.ray_head_port }} \
  --object-manager-port {{ engines.ray_jupyter.vars.ray_object_manager_port }} \
  --node-manager-port {{ engines.ray_jupyter.vars.ray_node_manager_port }} \
  --gcs-server-port {{ engines.ray_jupyter.vars.gcs_server_port }} \
  --include-dashboard true \
  --dashboard-port {{ engines.ray_jupyter.vars.ray_dashboard_port }} \
  --dashboard-host 0.0.0.0 \
  --num-cpus {{ engines.ray_jupyter.deployment.hardware.cpu.vcpus }} \
  --num-gpus {{ engines.ray_jupyter.deployment.hardware.gpus }} \
  --min-worker-port 11000 \
  --max-worker-port 12000 \
  --verbose

start-notebook.sh \
  --NotebookApp.token="{{ engines.ray_jupyter.vars.jupyter_token }}" \
  --NotebookApp.port={{ engines.ray_jupyter.vars.jupyter_port }} \
  --no-browser