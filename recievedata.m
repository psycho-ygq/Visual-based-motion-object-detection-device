function [Data] = recievedata(serialS)
    data = readline(serialS);
    
    A = strsplit(data);
    
    num = length(A);
    
    if num ~= 10 
        A = [];
        Ab = [0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0];
    else
        A(10) = [];
        Ab = str2double(A);
    end    
    Data = Ab;
end