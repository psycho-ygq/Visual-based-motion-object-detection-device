# Visual-based-motion-object-detection-device
# (2023 年陕西省大学生电子设计竞赛七校联赛 C 题，运动物体监测系统)

我的项目介绍了一种基于姿态检测的运动物体检测系统。
1. 我可以展示它现在相对于水平面在各个轴（俯仰、旋转和翻滚轴）的静态姿态。
2. 对于运动的物体，我可以根据连续变化的姿态解算出其运动/翻滚的路径，以及预测其在某个特定节点的姿态。
3. 系统被封装在一个<10cm×10cm×10cm的黑盒内，不需要任何外部供电，可以通过蓝牙和WiFi跟外部PC端/移动端通信，最大有效通信距离大于10m。
4. 我还设计了一个人机交互的APP来可视化这个系统的功能。
   
![image](https://github.com/user-attachments/assets/2769e038-b79f-4f63-8055-cce1d2d4c24c)

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

# APP

另外，我做了一个基于MATLAB的APP实现我们装置的人机交互功能。

APP的代码在"APP.zip"文件中，解压后运行"project_APP.exe"即可，另需要确保您的电脑安装了MATLAB APP的GUI包。

# 结果展示
我们将系统封装在一个黑盒中，可以实现自供电，数据通过蓝牙/WiFi传输到或者PC端或者移动端展示，最大有效传输距离>10m。

![image](https://github.com/user-attachments/assets/2769e038-b79f-4f63-8055-cce1d2d4c24c)

我们的装置可以实时显示物体的运动状态，包括偏转角度、各平面位置和自身位置等，可以实时在线的显示，视频帧率为大约为 15 FPS。结果显示如下图。

在APP中，我们可以选择各个功能。

![APP](https://github.com/psycho-ygq/Visual-based-motion-object-detection-device/assets/78340742/84f23278-bfd2-498e-ab91-c8a8b7ad8f69)

下面简单地展示了物体运动时，物体当前的位置。

![result_1](https://github.com/psycho-ygq/Visual-based-motion-object-detection-device/assets/78340742/441c7674-2d34-47a6-a034-d66f7084d704)

![result_2](https://github.com/psycho-ygq/Visual-based-motion-object-detection-device/assets/78340742/92885f3a-3ba8-4924-9f51-1dab23f29840)

![result_3](https://github.com/psycho-ygq/Visual-based-motion-object-detection-device/assets/78340742/632d135f-e5ec-4cf4-8dcd-1a005bc4b052)











