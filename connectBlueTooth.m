function s = connectBlueTooth(COM,Boundrate)

    instrreset;
    delete(instrfindall)
    disp('Press Ctrl+C to stop collecting data!')
    s=serialport(COM,Boundrate) ;

end