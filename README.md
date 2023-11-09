# turtlebot2_on_noetic

Setup Turtlebot2 on ROS Noetic (Ubuntu 20.04)

## Requirements

- ROS Noetic
- `git`
- `rosdep`

## Installation

```
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
curl -O https://raw.githubusercontent.com/shutosheep/turtlebot2_on_noetic/main/turtlebot2_on_noetic.sh
chmod +x turtlebot2_on_noetic.sh
./turtlebot2_on_noetic.sh
cd ~/catkin_ws/
catkin_make
. devel/setup.bash
```

## Add udev rules (Recommended)

To ensure the connections with Kobuki, it is recommended to add udev rules by
running the following command.

```
rosrun kobuki_ftdi create_udev_rules
```

## Run your Turtlebot

Bringup your turtlebot.

```
roslaunch turtlebot_bringup minimal.launch
```

Operate your turtlebot with keyboard.

```
roslaunch turtlebot_teleop keyboard_teleop.launch
```

## References

- https://github.com/gaunthan/Turtlebot2-On-Melodic
- https://github.com/Aoi-hosizora/turtlebot2-on-noetic
- https://github.com/hanruihua/Turtlebot2_on_Noetic
