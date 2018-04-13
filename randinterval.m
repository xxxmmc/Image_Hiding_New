function [ row,col ] = randinterval(matric,count)
    [m,n]=size(matric);
       x = randperm(m);
       row = x(1:count);
       y = randperm(n);
       col = y(1:count);


