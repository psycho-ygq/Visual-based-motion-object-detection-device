function CubeFace(serial)
%% 顶面判断

    flag_face = 1;
    flag = -1;
    
    pia1 = 0;
    pia2 = -90;
    pia3 = -180;
    pia4 = 90;
    pia5 = 180;
    %      X   |  Y   |  Z
    % A = pia1 | pia1 |  
    % B = pia4 | pia2 |  
    % C = pia5 | pia1 |  
    % D =      | pia4 | pia5
    % E = pia2 | pia1 |  
    % F = pia4 | pia1 |  
    
    delta = 9;
    %物体顶面 -1 为当前顶面 初始化为1
    A = 1;              
    B = 1;
    C = 1;
    D = 1;
    E = 1;
    F = 1;
    
    while(flag_face)
        data = recievedata(serial);
    %     D_data = [D_data ; data];
        % A
        if abs(data(7) - pia1) < delta && abs(data(8) - pia1) < delta && data(9)~=0
           if A ~= flag 
                fprintf("运动物体顶面标记：A\n")
                fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
                A = flag;
                B = ~flag;
                D = ~flag;
                E = ~flag;
                F = ~flag;
           end
        end
    
        % B
        if  abs(data(8) - pia2) < delta %&& abs(data(7) - pia4) < delta 
            if B ~= flag
                fprintf("运动物体顶面标记：B\n")
                fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
                B = flag;
                A = ~flag;
                C = ~flag;
                E = ~flag;
                F = ~flag;
            end
        end
        % C 
        if abs(data(7) - pia5) < delta && abs(data(8) - pia1) < delta
           if C ~= flag 
                fprintf("运动物体顶面标记：C\n")
                fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
                C = flag;
                B = ~flag;
                D = ~flag;
                E = ~flag;
                F = ~flag;
           end
        end
        % D
        if abs(data(8) - pia4) < delta %&& abs(data(9) - pia5) < delta
            if D ~= flag
                fprintf("运动物体顶面标记：D\n")
                fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
                D = flag;
                A = ~flag;
                C = ~flag;
                E = ~flag;
                F = ~flag;
            end
        end
        % E
        if abs(data(7) - pia2) < delta && abs(data(8) - pia1) < delta
           if E ~= flag 
                fprintf("运动物体顶面标记：E\n")
                fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
                E = flag;
                A = ~flag;
                B = ~flag;
                C = ~flag;
                D = ~flag;
           end
        end
        % F
        if abs(data(7) - pia4) < delta && abs(data(8) - pia1) < delta
            if F ~= flag
                fprintf("运动物体顶面标记：F\n")
                fprintf("X:%.3f Y:%.3f Z:%.3f\n",data(7),data(8),data(9))
                F = flag;
                A = ~flag;
                B = ~flag;
                C = ~flag;
                D = ~flag;
            end
        end
    
    end
end