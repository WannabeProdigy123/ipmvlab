clc;
clear;
## f = [   3 3 3 3 3 3 3 3 ; ...
##         3 3 255 255 3 3 3 3 ; ...
##         3 3 3 255 3 3 90 3 ; ...
##         3 3 3 3 3 3 3 3 ; ...
##         201 201 201 201 201 201 201 201 ; ...
##         201 201 201 0 201 0 201 201 ; ...
##         201 201 201 0 201 201 0 201 ; ...
##         201 201 201 201 201 201 201 201 ]

f1 = imread('Img_3.tif');
f = imnoise(f1, 'salt & pepper', 0.09);

[ row, col] = size(f)
g = f;
for x= 2:1:row-1
  for y= 2:1:col-1

    temp = [ f(x-1,y-1) f(x-1,y) f(x-1,y+1)...
             f(x,y-1) f(x,y) f(x,y+1)...
             f(x+1,y-1) f(x+1,y) f(x+1,y+1)];
    temp1 = sort(temp);
    g(x,y) = temp1(5);
  endfor
endfor

##g;

figure(1)
imshow(uint8(f1)),title('Original Image')

figure(2)
imshow(uint8(f)),title('noisy')

figure(3)
imshow(uint8(g)),title('median filter applied')
