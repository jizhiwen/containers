# syntax=docker/dockerfile:1

FROM ros:noetic-ros-base-focal

RUN echo 'ulimit -Sn 1024\n\
source /opt/ros/noetic/setup.sh\n\
source /work/catkin_ws/devel/setup.sh\n' >> /root/.bashrc
