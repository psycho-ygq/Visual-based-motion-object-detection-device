white = imread('text_figure\white.png');
black = imread('text_figure\black.png');
white= imresize(white,[300 300]);
black= imresize(black,[300 300]);
% 查看适配器
disp(imaqhwinfo);

% 查看设备及其支持的格式
info = imaqhwinfo('winvideo');

% 生成对象并同步画面
obj = videoinput('winvideo',2,'MJPG_640x480');
h = preview(obj);

temp=-1;
%生成单个图像
figure
while ishandle(h)

    A = getsnapshot(obj);
    A = rgb2gray(A);

    A (:, [1:84]) = [];    %去掉左边界
    A (:, [432:556]) = [];  %去掉右边界
    A ([1:28],:) = [];     %去掉上边界
    A ([428:452],:) = [];     %去掉下边界

    A= imresize(A,[640 640]);
    A1 = double(A);
    A2 = 1.5.^(A1*0.070)-1;
    A1 = uint8(A1);
    A2 = uint8(A2);

    level = graythresh(A1);  %求取二值化的阈值
    A3 = im2bw(A1, 0.15);   %按阈值进行二值化后的图像，阈值level越低越好

    %运用开操作消去噪点
    se = strel('disk',2);
    A4=imopen(A3,se);% 去噪后的图像
    A4=~A4;

    %获取连通区域，并进行显示
    % L = bwlabel(openbw,8);
    [L,num] = bwlabel(A4,8);
    A5 = label2rgb(L);
    
    
    I=A4;
    if length(size(I))>2
        I = rgb2gray(I);
    end
    if ~islogical(I)
        imBw = im2bw(I);                        %转换为二值化图像
    else
     imBw = I;
    end
    %imBw = im2bw(I); %转换为二值化图像
    imBw =I;
    imLabel = bwlabel(imBw);                %对各连通域进行标记
    stats = regionprops(imLabel,'Area');    %求各连通域的大小
    area = cat(1,stats.Area);
    index = find(area == max(area));        %求最大连通域的索引
    A6 = ismember(imLabel,index);          %获取最大连通域图像
    
    Ilabel = bwlabel(A6);     %连通区域标记函数
    stat = regionprops(Ilabel,'centroid');%用来度量图像区域属性的函数.常用来统计被标记的区域的面积分布，显示区域总数
    
%     figure(2)
%     subplot(221),imshow(A1);  %灰度图像
%     %subplot(332),imshow(A2);  %指数变化    不用！
%     subplot(222),imshow(A3);  %二值化后的图像
%     subplot(223),imshow(A4);  %去噪后的图像
%     %subplot(335),imshow(A5);  %加上颜色
%     subplot(224),imshow(A6);
    hold on;

    if numel(stat)==1
%         for x = 1: numel(stat)
%             plot(stat(x).Centroid(1),stat(x).Centroid(2),'b*');
%         end %最大联通区域
    
        stat(1).Centroid(1);stat(1).Centroid(2);
    
        if stat(1).Centroid(1)>0 && stat(1).Centroid(1) <160
            if stat(1).Centroid(2)>0 && stat(x).Centroid(2) <160
                site=12;end
            if stat(1).Centroid(2)>160 && stat(x).Centroid(2) <320
                site=8;end
            if stat(1).Centroid(2)>320 && stat(x).Centroid(2) <480
                site=4;end
            if stat(1).Centroid(2)>480 && stat(x).Centroid(2) <640
                site=0;end
        end
        
        if stat(1).Centroid(1)>160 && stat(1).Centroid(1) <320
            if stat(1).Centroid(2)>0 && stat(x).Centroid(2) <160
                site=13;end
            if stat(1).Centroid(2)>160 && stat(x).Centroid(2) <320
                site=9;end
            if stat(1).Centroid(2)>320 && stat(x).Centroid(2) <480
                site=5;end
            if stat(1).Centroid(2)>480 && stat(x).Centroid(2) <640
                site=1;end
        end
        
        if stat(1).Centroid(1)>320 && stat(1).Centroid(1) <480
            if stat(1).Centroid(2)>0 && stat(x).Centroid(2) <160
                site=14;end
            if stat(1).Centroid(2)>160 && stat(x).Centroid(2) <320
                site=10;end
            if stat(1).Centroid(2)>320 && stat(x).Centroid(2) <480
                site=6;end
            if stat(1).Centroid(2)>480 && stat(x).Centroid(2) <640
                site=2;end
        end
        
        if stat(1).Centroid(1)>480 && stat(1).Centroid(1) <640
            if stat(1).Centroid(2)>0 && stat(x).Centroid(2) <160
                site=15;end
            if stat(1).Centroid(2)>160 && stat(x).Centroid(2) <320
                site=11;end
            if stat(1).Centroid(2)>320 && stat(x).Centroid(2) <480
                site=7;end
            if stat(1).Centroid(2)>480 && stat(x).Centroid(2) <640
                site=3;end
        end
    
        if site~=temp
            fprintf('物体的横坐标为%6.2f,纵坐标为%6.2f,物体位于区域%d。\n',stat(1).Centroid(1),stat(1).Centroid(2),site);
            
        end
    end
    temp=site;

    if site==0
        site_num=13;
    end
    if site==1
        site_num=14;
    end
    if site==2
        site_num=15;
    end
    if site==3
        site_num=16;
    end
    if site==4
        site_num=9;
    end
    if site==5
        site_num=10;
    end
    if site==6
        site_num=11;
    end
    if site==7
        site_num=12;
    end
    if site==8
        site_num=5;
    end
    if site==9
        site_num=6;
    end
    if site==10
        site_num=7;
    end
    if site==11
        site_num=8;
    end
    if site==12
        site_num=1;
    end
    if site==13
        site_num=2;
    end
    if site==14
        site_num=3;
    end
    if site==15
        site_num=4;
    end

    figure(2);
    subplot(441),imshow(white);
    subplot(442),imshow(white);
    subplot(443),imshow(white);
    subplot(444),imshow(white);
    subplot(445),imshow(white);
    subplot(446),imshow(white);
    subplot(447),imshow(white);
    subplot(448),imshow(white);
    subplot(449),imshow(white);
    subplot(4,4,10),imshow(white);
    subplot(4,4,11),imshow(white);
    subplot(4,4,12),imshow(white);
    subplot(4,4,13),imshow(white);
    subplot(4,4,14),imshow(white);
    subplot(4,4,15),imshow(white);
    subplot(4,4,16),imshow(white);
    subplot(4,4,site_num),imshow(black);
    hold on;

    drawnow
end