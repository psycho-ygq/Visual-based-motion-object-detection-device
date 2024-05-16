function s = connectBlueTooth(COM,Boundrate)


n=menu('请选择您需要实现的功能',1,2,3,4,5);
switch n
    case 1,s = connectBlueTooth('com29',9600);
        fopen(s);
        BeginTest(s);
        CubeFace(s);
        delete(s);
        
        %run('F:\桌面文件\程序\COMangle.m');
    case 2,Angle(s);
        
        %run('F:\桌面文件\程序\Angle.m');
    case 3,run('detect_final_1.m');
    case 4,run('detect_final_1.m');
    case 5,run('detect_final_2.m');
end
n