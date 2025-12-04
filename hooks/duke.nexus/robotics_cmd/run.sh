#!/usr/bin/env bash
set -euo pipefail
cmd="$1"
topic="${2:-/cmd_vel}"
if command -v ros2 >/dev/null 2>&1; then
  export ROS_DOMAIN_ID="${ROS2_DOMAIN_ID:-0}"
  if ros2 topic pub --once "$topic" std_msgs/msg/String "data: '$cmd'" >/dev/null 2>&1; then
    echo "{\"status\":\"command_sent\",\"command\":\"$cmd\",\"topic\":\"$topic\"}"
  else
    echo "{\"status\":\"ros2_publish_failed\",\"command\":\"$cmd\"}"
  fi
else
  echo "{\"status\":\"ros2_not_installed\",\"hint\":\"source /opt/ros/humble/setup.bash or similar\"}"
fi
