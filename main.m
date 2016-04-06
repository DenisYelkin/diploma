clear;
I = imread('lena.jpg');
if length(I(1,1,:)) > 1
    temp_I = I(:,:,1);
    I=temp_I;
end
% figure;
% imshow(I);
disp('now img monochrome');
H = fspecial('gaussian', length(I(:, 1)), 5);
blur_I = imfilter(I, H, 'replicate');
disp('img blurred');
% figure;
% imshow(blur_I);
a = final_solver(I, blur_I, 500);
disp('solver solved');
unblur_I = final_unblur(blur_I, a);
disp('img unblurred');
% figure;
% imshow(unblur_I)

shift = 4;
sum = 0;
count = 0;
I = double(I);
unblur_I = double(unblur_I);
for i = shift : 1 : (length(I(:, 1)) - shift)
    for j = shift : 1 : (length(I(1, :)) - shift)
        sum = sum + (I(i, j) - unblur_I(i, j))^2;
        count = count + 1;
    end;
end;
result = sqrt(1 / count * sum);

% I = imread('cosmo1.jpg');
% if length(I(1,1,:)) > 1
%     temp_I = I(:,:,1);
%     I=temp_I;
% end
% % figure;
% % imshow(I);
% H = fspecial('gaussian', length(I(:, 1)), 5);
% blur_I = imfilter(I, H, 'replicate');
% % figure;
% % imshow(blur_I);
% unblur_I = final_unblur(blur_I, a);
% disp('img unblurred');
% figure;
% imshow(unblur_I)

% % dif = difference(I, unblur_I);
% % figure;
% % imshow(dif);
% 
% m = 25;
% lin = linear_solver(I, blur_I, m, 500);
% disp('linear solver solved');
% lin_unblur_I = unblur_lin(blur_I, lin);
% disp('img unblurred by linear');
% figure;
% imshow(lin_unblur_I);