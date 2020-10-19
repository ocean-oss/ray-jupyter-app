#!/bin/sh

set -e

# Make sure we wait enough time for the head node to start a Redis server. 5 seconds should be more
# than plenty.
sleep 5

start.sh ray start \
  --address {{ engines.ray-jupyter.vars.ray_head_host }}:{{ engines.ray-jupyter.vars.ray_head_port }} \
  --node-ip-address $(hostname -I) \
  --block \
  --object-manager-port {{ engines.ray-worker.vars.ray_object_manager_port }} \
  --node-manager-port {{ engines.ray-worker.vars.ray_node_manager_port }} \
  --num-cpus {{ engines.ray-worker.deployment.hardware.cpu.vcpus }} \
  --num-gpus {{ engines.ray-worker.deployment.hardware.gpus }} \
  --min-worker-port 11000 \
  --max-worker-port 12000 \
  --verbose