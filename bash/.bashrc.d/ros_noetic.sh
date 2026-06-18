alias cw='cd ~/catkin_ws'
alias cs='cd ~/catkin_ws/src'
alias cm='cd ~/catkin_ws && catkin_make'

source /opt/ros/noetic/setup.bash
source ~/catkin_ws/devel/setup.bash
source ~/profab_ws/devel/setup.bash

export LIBGL_ALWAYS_SOFTWARE=1
export TURTLEBOT3_MODEL=burger

# For simulation
export ROS_MASTER_URI=http://localhost:11311
export ROS_HOSTNAME=localhost

# For real robot
# HOSTNAME=$(hostname -I | xargs) # xargs strips whitespace
# export ROS_MASTER_URI=http://${HOSTNAME}:11311
# export ROS_HOSTNAME=${HOSTNAME}
# export TURTLEBOT3_HOSTNAME=ubuntu@192.168.1.106
