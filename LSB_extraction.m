imwrite(LSB_image,'LSB_image.bmp'); %���������ͼƬ���
Picture=imread('LSB_image.bmp'); 
Picture=double(Picture); 
Picture_R=Picture(:,:,1); 
frr=fopen('txt','w'); %��д�뷽ʽ��ֻд�ļ� 
p = 1;
msg_len = 88;%��֪��Ϣ�ĳ��ȣ���������㷨�ϵ��Ż�
             %�������ʹͼƬ�ڴ����ʱ���öԷ�֪��
             %���ж�������
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