# Visual-based-motion-object-detection-device (2023 年陕西省大学生电子设计竞赛七校联赛 C 题，运动物体监测系统)

My project introduces a motion object detection device based on computer vision. For a hexahedron, the pose of the hexahedron can be detected, such as the position of each plane, and the motion trajectory of the object can be detected through a threshold segmentation algorithm.

# 一、任务
设计并制作一个运动物体监测系统，系统包括1个运动物体和1个测量终端。运动物体内部包含传感器、无线通信和电源等电路；测量终端可采用手机、电脑或自制装置。显示终端接收来自运动物体的信息，并显示工作状态、倾斜角度、摆放姿态和移动路径等数据。监测系统的组成如图 1 所示，监测系统的测试板布置及倾斜角度测试示意如图 2 所示。
![image](https://github.com/psycho-ygq/Visual-based-motion-object-detection-device/assets/78340742/baa52b55-8738-4b2b-ade8-c3f6ced98d17)
![image](https://github.com/psycho-ygq/Visual-based-motion-object-detection-device/assets/78340742/70f0f210-4e5c-441a-b1b4-c7397d23475f)
# 发挥部分
（1）测试板平放，将运动物体放置于测试板“00”标号方格内，按照测试指令要求，沿 X 或 Y 方向滚动翻转运动物体（每次翻 1 格，途经标号不重复），翻转次数≥8，要求测量终端显示运动物体滚动经过的测试板方格标号。
（2）测试板平放，将运动物体放置于测试板上的任意标号方格内，按照测试指令要求，沿 X 或 Y 方向平移推动（每次推 1 格，途经标号可重复），推动次数≥8，运动物体最终停在标号为“00”、”03”、”12”、”15”之一的方格，要求测试终端显示运动物体初始放置的方格标号。




