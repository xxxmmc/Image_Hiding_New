image=imread('F:\matlab1\bin\imageprocess\Image_Hiding\nice.bmp');%读入一张图片
LSB_image = image;
image1=LSB_image(:,:,1);%取图像层
word=fopen('word.txt','r');%以二进制读取文件
[word,word_len]=fread(word,'ubit1');
[row,col] = randinterval(image1,word_len);%生成产生的随机数
p = 1;% p为秘密信息的位计数器
for i=1:word_len
    image1(row(i),col(i))=image1(row(i),col(i))-mod(image1(row(i),col(i)),2)+word(p,1);%把结尾归成0，后一位完全由文字判断,LSB
    if p == word_len
    end
    p = p+1;
end
LSB_image(:,:,1)=image1;
LSB_image=uint8(LSB_image);
imshow(LSB_image);

