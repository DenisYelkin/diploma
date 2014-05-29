clear;
I = imread('cosmo1.jpg');
if length(I(1,1,:)) > 1
    temp_I = I(:,:,1);
    I=temp_I;
end
disp('now img monochrome');
% I = addLight(I);
% disp('add light');
% imshow(I);
% disp('show src img');
% blur_I = blur(I, 0.1, 0.1, 0.2, 0.13, 0.13, 0.14, 0.3, 0.3);
H = fspecial('gaussian', length(I(:, 1)), 2);
blur_I = imfilter(I, H, 'replicate');
disp('img blurred');
figure;
imshow(blur_I)
n = 12;
a = zeros(1, n);
while sum(a) > 1.01 || sum(a) < 0.99
    a = final_solver(I, blur_I, 500);
end
disp('solver solved');
sum(a)
unblur_I = final_unblur(blur_I, a);
disp('img unblurred');
figure;
imshow(unblur_I)
dif = difference(I, unblur_I);
figure;
imshow(dif);

m = 25;
lin = zeros(1, m);
while sum(lin) > 1.1 || sum(lin) < 0.99
    lin = linear_solver(I, blur_I, m, 500);
end;
disp('linear solver solved');
sum(lin)
lin_unblur_I = unblur_lin(blur_I, lin);
disp('img unblurred by linear');
figure;
imshow(lin_unblur_I);