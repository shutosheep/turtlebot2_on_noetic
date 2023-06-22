# turtlebot2_on_noetic

Setup Turtlebot2 on ROS noetic

## Requirements

The following must be installed

- Ubuntu 20.04
- ROS noetic
- `rosdep`

## Installation

```
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
curl -sLf https://raw.githubusercontent.com/shutosheep/turtlebot2_on_noetic/main/install.sh | sh
cd ~/catkin_ws/
catkin_make
```

## Test your Turtlebot2

Bringup your turtlebot.

```
source ./devel/setup.bash
roslaunch turtlebot_bringup minimal.launch
```

Operate your turtlebot with keyboard.

```
source ./devel/setup.bash
roslaunch turtlebot_teleop keyboard_teleop.launch
```

## Refrences

- https://github.com/gaunthan/Turtlebot2-On-Melodic
- https://github.com/Aoi-hosizora/turtlebot2-on-noetic
- https://github.com/hanruihua/Turtlebot2_on_Noetic
