image=imread('F:\matlab1\bin\imageprocess\Image_Hiding\nice.bmp');%����һ��ͼƬ
LSB_image = image;
image1=LSB_image(:,:,1);%ȡͼ���
word=fopen('word.txt','r');%�Զ����ƶ�ȡ�ļ�
[word,word_len]=fread(word,'ubit1');
[row,col] = randinterval(image1,word_len);%���ɲ����������
p = 1;% pΪ������Ϣ��λ������
for i=1:word_len
    image1(row(i),col(i))=image1(row(i),col(i))-mod(image1(row(i),col(i)),2)+word(p,1);%�ѽ�β���0����һλ��ȫ�������ж�,LSB
    if p == word_len
    end
    p = p+1;
end
LSB_image(:,:,1)=image1;
LSB_image=uint8(LSB_image);
imshow(LSB_image);

