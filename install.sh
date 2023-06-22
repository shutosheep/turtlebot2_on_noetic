#!/bin/sh

set -eu

# TODO
# fix cannot launch node of laptop_battery_monitor/laptop_battery.py error when launching
# roslaunch turtlebot_bringup minimal.launch

UBUNTU_VER=$(lsb_release -sc)
[ "$UBUNTU_VER" = "focal" ] || exit 1

# clean source if it exists
[ -d turtlebot2 ] && rm -rf turtlebot2

mkdir turtlebot2
cd turtlebot2

# turtlebot2
git clone --depth 1 https://github.com/turtlebot/turtlebot.git
git clone --depth 1 https://github.com/turtlebot/turtlebot_msgs.git
git clone --depth 1 https://github.com/turtlebot/turtlebot_simulator
git clone --depth 1 https://github.com/turtlebot/turtlebot_apps.git

# kobuki
git clone --depth 1 https://github.com/yujinrobot/kobuki_msgs.git
git clone --depth 1 -b melodic https://github.com/yujinrobot/kobuki.git
git clone --depth 1 -b melodic https://github.com/yujinrobot/kobuki_desktop.git

# yocs_controllers
git clone --depth 1 https://github.com/yujinrobot/yujin_ocs.git
git clone --depth 1 https://github.com/yujinrobot/yocs_msgs.git
mv yujin_ocs/yocs_cmd_vel_mux yujin_ocs/yocs_controllers .
rm -rf yujin_ocs/

# viz
git clone -b indigo https://github.com/turtlebot/turtlebot_viz.git

# kobuki_core
git clone -b melodic https://github.com/yujinrobot/kobuki_core.git

# ecl_*
git clone --depth 1 -b release/0.61-noetic https://github.com/stonier/ecl_tools.git
git clone --depth 1 -b release/0.61-noetic https://github.com/stonier/ecl_lite.git
git clone --depth 1 -b release/0.62-noetic https://github.com/stonier/ecl_core.git
git clone --depth 1 -b release/0.60-melodic https://github.com/stonier/ecl_navigation.git

rosdep update
rosdep install --from-paths . -r -y --ignore-src

# fix error when running roslaunch turtlebot_bringup minimal.launch
# cannot launch node of laptop_battery_monitor/laptop_battery.py error
sudo apt remove -y ros-noetic-laptop-battery-monitor

# fix error with using old python
sed -i "s,#!/usr/bin/env python,#!/usr/bin/env python3,g" turtlebot/turtlebot_teleop/scripts/turtlebot_teleop_key
