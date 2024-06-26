clc;
clear;
## f = [   3 3 3 3 3 3 3 3 ; ...
##         3 3 3 3 3 3 3 3 ; ...
##         3 3 3 3 3 3 3 3 ; ...
##         3 3 3 3 3 3 3 3 ; ...
##         201 201 201 201 201 201 201 201 ; ...
##         201 201 201 201 201 201 201 201 ; ...
##         201 201 201 201 201 201 201 201 ; ...
##         201 201 201 201 201 201 201 201 ]

f = double(imread('Img_3.tif'));

[ row, col] = size(f)

w = [ -1 -1 -1 ; -1 8 -1 ; -1 -1 -1 ];

##g = f;

for x= 2:1:row-1
  for y= 2:1:col-1
    g(x,y) = f(x-1,y-1)*w(1,1)  + f(x-1,y)*w(1,2) + f(x-1,y+1)*w(1,3) + ...
             f(x,y-1)*w(2,1)    + f(x,y)*w(2,2)   + f(x,y+1)*w(2,3) + ...
             f(x+1,y-1)*w(3,1)  + f(x+1,y)*w(3,2) + f(x+1,y+1)*w(3,3);
  endfor
endfor

g;

figure(1)
imshow(uint8(f)),title('original image')
figure(2)
imshow(uint8(g)),title('high pass filter')

