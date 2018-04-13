imwrite(LSB_image,'LSB_image.bmp'); %将输入的新图片输出
Picture=imread('LSB_image.bmp'); 
Picture=double(Picture); 
Picture_R=Picture(:,:,1); 
frr=fopen('txt','w'); %以写入方式打开只写文件 
p = 1;
msg_len = 88;%已知信息的长度，这儿存在算法上的优化
             %，即如何使图片在传输的时候让对方知道
             %我有多少数据
for i=1:msg_len
    if bitand(Picture_R(row(i),col(i)),1)==1
    fwrite(frr,1,'ubit1');
    result(p)=1;
    else
    fwrite(frr,0,'ubit1');
    result(p)=0;
    end
    if p==msg_len
        break;
    end
        p=p+1;   
end