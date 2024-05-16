# Visual-based-motion-object-detection-device (2023 年陕西省大学生电子设计竞赛七校联赛 C 题，运动物体监测系统)

My project introduces a motion object detection device based on computer vision. For a hexahedron, the pose of the hexahedron can be detected, such as the position of each plane, and the motion trajectory of the object can be detected through a threshold segmentation algorithm.

# 一、任务
设计并制作一个运动物体监测系统，系统包括1个运动物体和1个测量终端。运动物体内部包含传感器、无线通信和电源等电路；测量终端可采用手机、电脑或自制装置。显示终端接收来自运动物体的信息，并显示工作状态、倾斜角度、摆放姿态和移动路径等数据。监测系统的组成如图 1 所示，监测系统的测试板布置及倾斜角度测试示意如图 2 所示。
![image](https://github.com/psycho-ygq/Visual-based-motion-object-detection-device/assets/78340742/a97c282e-9ed0-41f9-98bc-4977218c2fed)

![image](https://github.com/psycho-ygq/Visual-based-motion-object-detection-device/assets/78340742/70f0f210-4e5c-441a-b1b4-c7397d23475f)
# 基本要求
（1）用手摇晃运动物体可以切换其内部电路状态，对应工作或停止状态，测量终端分别显示 ON 或 OFF。（10 分）
  
（2）将运动物体放置于测试板上，按照图 2（b）、图 2（c）给出的方式抬起测试板，要求测量终端显示α和β的角度值，测量角度误差绝对值小于 1°。（20 分）
  
（3）在平放的测试板上随机摆放运动物体，要求测量终端显示运动物体的顶面标记。（20 分）

# 发挥部分
（1）测试板平放，将运动物体放置于测试板“00”标号方格内，按照测试指令要求，沿 X 或 Y 方向滚动翻转运动物体（每次翻 1 格，途经标号不重复），翻转次数≥8，要求测量终端显示运动物体滚动经过的测试板方格标号。（25分）

（2）测试板平放，将运动物体放置于测试板上的任意标号方格内，按照测试指令要求，沿 X 或 Y 方向平移推动（每次推 1 格，途经标号可重复），推动次数≥8，运动物体最终停在标号为“00”、”03”、”12”、”15”之一的方格，要求测试终端显示运动物体初始放置的方格标号。（20分）

# 代码解读

"choice.m"实现功能选择，针对不同的要求实现不同的功能。

"COMangle.m", "connectBlueTooth.m", "recievedata.m"文件实现蓝牙和串口连接，蓝牙连接传感器（MPU），串口与摄像头连接。

"BeginTest.m"是启动文件，实现“基本要求”中的（1）。

"Angle.m"文件实现基本要求中的（2）。

"CubeFace.m"文件实现基本要求中的（3）。

"detect_final_1.m"和"detect_final_2.m"分别实现发挥部分的（1）和（2）。






