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

f1 = uint8(imread('Img_3.tif'));

f = imnoise(f1, 'gaussian');

[ row, col] = size(f)

w = [ 1 1 1 ; 1 1 1 ; 1 1 1 ]/9;



for x= 2:1:row-1
  for y= 2:1:col-1
    g(x,y) = f(x-1,y-1)*w(1,1)  + f(x-1,y)*w(1,2) + f(x-1,y+1)*w(1,3) + ...
             f(x,y-1)*w(2,1)    + f(x,y)*w(2,2)   + f(x,y+1)*w(2,3) + ...
             f(x+1,y-1)*w(3,1)  + f(x+1,y)*w(3,2) + f(x+1,y+1)*w(3,3);
  endfor
endfor



figure(1)
imshow(uint8(f1)),title('noisy')
figure(2)
imshow(uint8(f)),title('average filter applied')
figure(3)
imshow(uint8(g)),title('Original Image')
