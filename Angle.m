function Angle(serial)
% 角度修正
ax_t = 0.0;                 %X轴角度修正
ay_t = 0.0;                 %Y轴角度修正
ax_tar = 0.0;
ay_tar = 0.0;
xz = 0;
flag_angle = 1;
count_tt = 0;               %修正计时
% count_t = 0;              %摇晃次数
% count_n = 0;              %重置计数

fprintf("开始角度测量，请等待角度校准")
pause(1)
while(flag_angle)
    data = recievedata(serial);
%     D_data = [D_data ; data];
    ax = data(7);
    ay = data(8);
    az = data(9);

    if abs(ax) < 3 && abs(ay) < 2  && xz == 0
        count_tt = count_tt + 1;
    else
        count_tt = 0;
    end
    if count_tt >=30 && xz == 0
        ax_t = ax - ax_tar;
        ay_t = ay - ay_tar;
        count_tt = count_tt - 6;
    end
%     ax
%     ay
%     ax_t
%     ay_t
    ax_r = ax - ax_t        %测量角度alpha
    ay_r = ay - ay_t        %测量角度beta
    if abs(ax_r) <= 0.015 && abs(ay_r) <= 0.015 && xz == 0
        xz = 1;
        fprintf("已完成角度校准")
    elseif  abs(ax_r) > 0.2 && abs(ay_r) >= 0.2 && abs(ax_r) < 1 && abs(ay_r) < 1 
        xz = 0;
    end

end
end