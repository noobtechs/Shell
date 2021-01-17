Example Project
===============

This contains a simple ROS catkin package meant to demonstrate the pipeline for
testing and getting results for Shell Eco-marathon simulation projects.

Requirements
------------

The software requires [Ubuntu Linux 18.04](https://ubuntu.com/download/desktop) and
[ROS Melodic](http://wiki.ros.org/melodic) to build and run.

Important considerations:
* Project submissions are compiled in a fresh Ubuntu Linux 18.04 / ROS Melodic
  environment.
* Any software dependencies must be defined properly in the
  [catkin package manifest](http://wiki.ros.org/catkin/package.xml) and will be
  installed at build time by [rosdep](http://wiki.ros.org/rosdep).
* All ROS packages must [install](http://wiki.ros.org/catkin/CMakeLists.txt#Optional_Step:_Specifying_Installable_Targets)
  themselves when built; the source code will not be present in the simulation
  environment, only installed targets.
* All project submissions **must** have a package named `shell_simulation` with a
  launch file named `shell_simulation.launch` that requires no parameters or arguments
  in order to run; this is used as the entry point for launching the project.
* Uploaded projects *must* be named `project.zip` and contain only the source
  code of ROS packages.
* The simulation will automatically end after either all goals have been reached
or after it has been running for 10 minutes.

There are currently nineteen goal points defined with the following X/Y/Z coordinates:
```
[ 
  [-87.0, 1.5, 0.0],
  [-213.0, -47.0, 0.0],
  [-213.0, -120.0, 0.0],
  [-94.0, -130.0, 0.0],
  [-81.7, -8.3, 0.0],
  [34.5, -2.6, 0.0],
  [-199.7, -254.0, 0.0],
  [-209.3, -8.1, 0.0],
  [-93.5, -2.0, 0.0],
  [-86.0, -119.4, 0.0],
  [33.7, -129.4, 0.0],
  [45.9, -9.8, 0.0],
  [-64.5, 1.8, 0.0],
  [-86.3, -37.3, 0.0],
  [-204.2, -45.8, 0.0],
  [-213.0, -60.0, 0.0],
  [-86.3, -139.2, 0.0],
  [-86.4, -248.2, 0.0],
  [-33.2, -240.4, 0.0]
]
```

The first goal point is directly in front of the vehicle, so simply increasing the
throttle is enough to reach it.

Usage
-----

The following ROS topics are available within the simulation:

```
Published topics:
 * /airsim_node/origin_geo_point [airsim_car_ros_pkgs/GPSYaw]
 * /airsim_node/PhysXCar/back_left_bumblebee/DepthPlanner/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/back_left_bumblebee/DepthPlanner [sensor_msgs/Image]
 * /airsim_node/PhysXCar/back_left_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/back_left_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/back_right_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/back_right_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/collision_count [std_msgs/Int32]
 * /airsim_node/PhysXCar/front_left_bumblebee/DepthPlanner/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_left_bumblebee/DepthPlanner [sensor_msgs/Image]
 * /airsim_node/PhysXCar/front_left_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_left_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/front_middle_bumblebee/DepthPlanner/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_middle_bumblebee/DepthPlanner [sensor_msgs/Image]
 * /airsim_node/PhysXCar/front_right_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_right_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/imu/Imu [sensor_msgs/Imu]
 * /airsim_node/PhysXCar/left_fisheye/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/left_fisheye/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/lidar/SICK [sensor_msgs/PointCloud2]
 * /airsim_node/PhysXCar/lidar/VLP16_1 [sensor_msgs/PointCloud2]
 * /airsim_node/PhysXCar/lidar/VLP16_2 [sensor_msgs/PointCloud2]
 * /airsim_node/PhysXCar/lidar/VLP16_3 [sensor_msgs/PointCloud2]
 * /airsim_node/PhysXCar/right_fisheye/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/right_fisheye/Scene [sensor_msgs/Image]
 * /odom [nav_msgs/Odometry]
 * /rosout_agg [rosgraph_msgs/Log]
 * /rosout [rosgraph_msgs/Log]s
 * /tf_static [tf2_msgs/TFMessage]
 * /tf [tf2_msgs/TFMessage]

Subscribed topics:
 * /airsim_node/PhysXCar/back_left_bumblebee/DepthPlanner/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/back_left_bumblebee/DepthPlanner [sensor_msgs/Image]
 * /airsim_node/PhysXCar/back_left_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/back_left_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/back_right_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/back_right_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/collision_count [std_msgs/Int32]
 * /airsim_node/PhysXCar/front_left_bumblebee/DepthPlanner/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_left_bumblebee/DepthPlanner [sensor_msgs/Image]
 * /airsim_node/PhysXCar/front_left_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_left_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/front_middle_bumblebee/DepthPlanner/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_middle_bumblebee/DepthPlanner [sensor_msgs/Image]
 * /airsim_node/PhysXCar/front_right_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_right_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/imu/Imu [sensor_msgs/Imu]
 * /airsim_node/PhysXCar/left_fisheye/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/left_fisheye/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/lidar/SICK [sensor_msgs/PointCloud2]
 * /airsim_node/PhysXCar/lidar/VLP16_1 [sensor_msgs/PointCloud2]
 * /airsim_node/PhysXCar/lidar/VLP16_2 [sensor_msgs/PointCloud2]
 * /airsim_node/PhysXCar/lidar/VLP16_3 [sensor_msgs/PointCloud2]
 * /airsim_node/PhysXCar/right_fisheye/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/right_fisheye/Scene [sensor_msgs/Image]
 * /brake_command [std_msgs/Float64]
 * /gear_command [std_msgs/String]
 * /handbrake_command [std_msgs/Bool]
 * /odom [nav_msgs/Odometry]
 * /rosout_agg [rosgraph_msgs/Log]
 * /rosout [rosgraph_msgs/Log]s
 * /steering_command [std_msgs/Float64]
 * /tf_static [tf2_msgs/TFMessage]
 * /tf [tf2_msgs/TFMessage]
 * /throttle_command [std_msgs/Float64]
```

These topics have data from sensors that can be used to observe the environment:

```
 * /airsim_node/PhysXCar/back_left_bumblebee/DepthPlanner/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/back_left_bumblebee/DepthPlanner [sensor_msgs/Image]
 * /airsim_node/PhysXCar/back_left_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/back_left_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/back_right_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/back_right_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/front_left_bumblebee/DepthPlanner/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_left_bumblebee/DepthPlanner [sensor_msgs/Image]
 * /airsim_node/PhysXCar/front_left_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_left_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/front_middle_bumblebee/DepthPlanner/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_middle_bumblebee/DepthPlanner [sensor_msgs/Image]
 * /airsim_node/PhysXCar/front_right_bumblebee/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/front_right_bumblebee/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/imu/Imu [sensor_msgs/Imu]
 * /airsim_node/PhysXCar/left_fisheye/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/left_fisheye/Scene [sensor_msgs/Image]
 * /airsim_node/PhysXCar/lidar/SICK [sensor_msgs/PointCloud2]
 * /airsim_node/PhysXCar/lidar/VLP16_1 [sensor_msgs/PointCloud2]
 * /airsim_node/PhysXCar/right_fisheye/Scene/camera_info [sensor_msgs/CameraInfo]
 * /airsim_node/PhysXCar/right_fisheye/Scene [sensor_msgs/Image]
```

And messages can be published to this topic to control the vehicle:

```
 * /brake_command [std_msgs/Float64]
   Valid values range from 0.0 (no brake) to 1.0 (full brake)
 * /gear_command [std_msgs/String]
   Valid values are "forward" or "reverse"
 * /handbrake_command [std_msgs/Bool]
   If set to "true", throttle will be ignored
 * /steering_command [std_msgs/Float64]
   Valid values range from -1.0 (full left) to 1.0 (full right)
 * /throttle_command [std_msgs/Float64]
   Valid values range from 0.0 (no throttle) to 1.0 (full throttle)
```
