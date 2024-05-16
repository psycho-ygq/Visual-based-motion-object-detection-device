clc;
close all;
clear all;

% instrreset;
% delete(instrfindall)
% disp('Press Ctrl+C to stop collecting data!')
% s=serialport('com12',9600) ;fopen(s) ;%Open Com Port

s = connectBlueTooth('com29',9600);
fopen(s);


% %% 启动程序判断 （摇晃BD面）
% flag_begin = 0;                 %启动程序指示
% flag_level = 0;                 %水平指示 (1为开启 0为关闭)
% i = 1;
% D_data = [0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0];
% count_t = 0;                    %摇晃次数
% count_n = 0;                    %重置计数
% temp = 0;
% tx = 2;
% while(~flag_begin)
%     data = recievedata(s);
%     D_data = [D_data ; data];
%     if data(3) > 0.9 && flag_level == 0
%         flag_level = 1;
%         fprintf("已水平放置\n")
%         fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
%     elseif flag_level ~= 1
%         flag_level = 0;
%     end
%     if flag_level == 1
%         if abs(data(8)) > 15
%             temp(tx) = data(8);
%             if abs(data(8)-temp(tx-1)) > 15
%             count_t = count_t + 1
%             end
%             tx = tx + 1
%             count_n = 0;
%         elseif abs(data(8)) < 15 && tx > 2 && tx <= 15
%             tx = tx + 1
%         end
%         if tx == 15
%             if count_t  >= 6
%                 flag_begin =~ flag_begin;
%                 count_t = 0
%                 count_n = 0;
%                 tx = 2
%             else
%                 count_t = 0
%                 count_n = 0;
%                 tx = 2
%             end
%         end
%         
%     end
% 
%     i = i +1;
%     if i>100
%         fprintf("等待时间过长，晃动BD面四次开始测试");
%         i = 0;
%     end
%     
% end

BeginTest(s);


%% 角度测量     
% % 角度修正
% ax_t = 0.0;                 %X轴角度修正
% ay_t = 0.0;                 %Y轴角度修正
% ax_tar = 0.0;
% ay_tar = 0.0;
% xz = 0;
% flag_angle = 1;
% count_tt = 0;               %修正计时
% % count_t = 0;              %摇晃次数
% % count_n = 0;              %重置计数
% 
% fprintf("开始角度测量，请等待角度校准")
% pause(1)
% while(flag_angle)
%     data = recievedata(s);
% %     D_data = [D_data ; data];
%     ax = data(7);
%     ay = data(8);
%     az = data(9);
% 
%     if abs(ax) < 3 && abs(ay) < 2  && xz == 0
%         count_tt = count_tt + 1;
%     else
%         count_tt = 0;
%     end
%     if count_tt >=30 && xz == 0
%         ax_t = ax - ax_tar;
%         ay_t = ay - ay_tar;
%         count_tt = count_tt - 6;
%     end
% %     ax
% %     ay
% %     ax_t
% %     ay_t
%     ax_r = ax - ax_t        %测量角度alpha
%     ay_r = ay - ay_t        %测量角度beta
%     if abs(ax_r) <= 0.015 && abs(ay_r) <= 0.015 && xz == 0
%         xz = 1;
%         fprintf("已完成角度校准")
%     elseif  abs(ax_r) > 0.2 && abs(ay_r) >= 0.2 && abs(ax_r) < 1 && abs(ay_r) < 1 
%         xz = 0;
%     end
% 
% end

% Angle(s);


%% 顶面判断

CubeFace(s);
% 
% flag_face = 1;
% flag = -1;
% 
% pia1 = 0;
% pia2 = -90;
% pia3 = -180;
% pia4 = 90;
% pia5 = 180;
% %      X   |  Y   |  Z
% % A = pia1 | pia1 |  
% % B = pia4 | pia2 |  
% % C = pia5 | pia1 |  
% % D =      | pia4 | pia5
% % E = pia2 | pia1 |  
% % F = pia4 | pia1 |  
% 
% delta = 9;
% %物体顶面 -1 为当前顶面 初始化为1
% A = 1;              
% B = 1;
% C = 1;
% D = 1;
% E = 1;
% F = 1;
% 
% count_t = 0;        %摇晃次数
% count_n = 0;        %重置计数
% 
% while(flag_face)
%     data = recievedata(s);
% %     D_data = [D_data ; data];
%     % A
%     if abs(data(7) - pia1) < delta && abs(data(8) - pia1) < delta && data(9)~=0
%        if A ~= flag 
%             fprintf("运动物体顶面标记：A\n")
%             fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
%             A = flag;
%             B = ~flag;
%             D = ~flag;
%             E = ~flag;
%             F = ~flag;
%        end
%     end
% 
%     % B
%     if  abs(data(8) - pia2) < delta %&& abs(data(7) - pia4) < delta 
%         if B ~= flag
%             fprintf("运动物体顶面标记：B\n")
%             fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
%             B = flag;
%             A = ~flag;
%             C = ~flag;
%             E = ~flag;
%             F = ~flag;
%         end
%     end
%     % C 
%     if abs(data(7) - pia5) < delta && abs(data(8) - pia1) < delta
%        if C ~= flag 
%             fprintf("运动物体顶面标记：C\n")
%             fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
%             C = flag;
%             B = ~flag;
%             D = ~flag;
%             E = ~flag;
%             F = ~flag;
%        end
%     end
%     % D
%     if abs(data(8) - pia4) < delta %&& abs(data(9) - pia5) < delta
%         if D ~= flag
%             fprintf("运动物体顶面标记：D\n")
%             fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
%             D = flag;
%             A = ~flag;
%             C = ~flag;
%             E = ~flag;
%             F = ~flag;
%         end
%     end
%     % E
%     if abs(data(7) - pia2) < delta && abs(data(8) - pia1) < delta
%        if E ~= flag 
%             fprintf("运动物体顶面标记：E\n")
%             fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
%             E = flag;
%             A = ~flag;
%             B = ~flag;
%             C = ~flag;
%             D = ~flag;
%        end
%     end
%     % F
%     if abs(data(7) - pia4) < delta && abs(data(8) - pia1) < delta
%         if F ~= flag
%             fprintf("运动物体顶面标记：F\n")
%             fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
%             F = flag;
%             A = ~flag;
%             B = ~flag;
%             C = ~flag;
%             D = ~flag;
%         end
%     end
% 
% end


delete(s)