function flag_begin=BeginTest(serial)
    %% 启动程序判断 （摇晃BD面）
    flag_begin = 0;                 %启动程序指示
    flag_level = 0;                 %水平指示 (1为开启 0为关闭)
    i = 1;
    % D_data = [0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0];
    count_t = 0;                    %摇晃次数
    count_n = 0;                    %重置计数
    temp = 0;
    tx = 2;
    while(~flag_begin)
        data = recievedata(serial);
    %     D_data = [D_data ; data];
        if data(3) > 0.9 && flag_level == 0
            flag_level = 1;
            fprintf("已水平放置\n")
            fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
        elseif flag_level ~= 1
            flag_level = 0;
        end
        if flag_level == 1
            if abs(data(8)) > 15
                temp(tx) = data(8);
                if abs(data(8)-temp(tx-1)) > 15
                count_t = count_t + 1;
                end
                tx = tx + 1;
                count_n = 0;
            elseif abs(data(8)) < 15 && tx > 2 && tx <= 15
                tx = tx + 1;
            end
            if tx == 15
                if count_t  >= 6
                    flag_begin =~ flag_begin;
                    count_t = 0;
                    count_n = 0;
                    tx = 2;
                else
                    count_t = 0;
                    count_n = 0;
                    tx = 2;
                end
            end
            
        end
    
        i = i +1;
        if i>100
            fprintf("等待时间过长，晃动BD面四次开始测试");
            i = 0;
        end
        
    end
end