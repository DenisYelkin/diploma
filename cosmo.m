I = imread('Mire.png');
if length(I(1,1,:)) > 1
    temp_I = I(:,:,1);
    I=temp_I;
end
disp('now img monochrome');
I = addLight(I);
disp('add light');
imshow(I);
disp('show src img');
% blur_I = blur(I, 0.1, 0.1, 0.2, 0.13, 0.13, 0.14, 0.3, 0.3);
H = fspecial('gaussian', length(I(:, 1)), 2);
blur_I = imfilter(I, H, 'replicate');
disp('img blurred');
figure;
imshow(blur_I)
unblur_I = final_unblur(blur_I, a);
disp('img unblurred');
figure;
imshow(unblur_I)

dif = difference(I, unblur_I);
figure;
imshow(dif);

lin_unblur_I = unblur_lin(blur_I, lin);
disp('img unblurred lin');
figure;
imshow(lin_unblur_I)