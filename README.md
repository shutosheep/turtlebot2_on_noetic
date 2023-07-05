# turtlebot2_on_noetic

Setup Turtlebot2 on ROS Noetic (Ubuntu 20.04)

## Requirements

- ROS Noetic on Ubuntu 20.04
- `rosdep` command

## Installation

```
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
curl -sLf https://raw.githubusercontent.com/shutosheep/turtlebot2_on_noetic/main/install.sh | sh
cd ~/catkin_ws/
catkin_make
```

## Add udev rules (Recommended)

To ensure the connections with Kobuki, it is recommended to add udev rules by
running the following command.

```
source devel/setup.bash
rosrun kobuki_ftdi create_udev_rules
```

## Run your Turtlebot2

Bringup your turtlebot.

```
source devel/setup.bash
roslaunch turtlebot_bringup minimal.launch
```

Operate your turtlebot with keyboard.

```
source devel/setup.bash
roslaunch turtlebot_teleop keyboard_teleop.launch
```

## References

- https://github.com/gaunthan/Turtlebot2-On-Melodic
- https://github.com/Aoi-hosizora/turtlebot2-on-noetic
- https://github.com/hanruihua/Turtlebot2_on_Noetic
