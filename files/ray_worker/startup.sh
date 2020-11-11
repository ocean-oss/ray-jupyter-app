#!/bin/sh

set -e

# Make sure we wait enough time for the head node to start a Redis server. 5 seconds should be more
# than plenty.
sleep 5

start.sh ray start \
  --address {{ engines.ray_jupyter.vars.ray_head_host }}:{{ engines.ray_jupyter.networking.ports.ray_head.value }} \
  --node-ip-address $(hostname -I) \
  --block \
  --object-manager-port {{ engines.ray_worker.networking.ports.ray_object_manager.value }} \
  --node-manager-port {{ engines.ray_worker.networking.ports.ray_node_manager.value }} \
  --num-cpus {{ engines.ray_worker.deployment.hardware.cpu.vcpus }} \
  --num-gpus {{ engines.ray_worker.deployment.hardware.gpus }} \
  --min-worker-port 11000 \
  --max-worker-port 12000 \
  --verbose