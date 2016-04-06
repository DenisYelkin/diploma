clear;
I = imread('./article_research/lena_source.png');
if length(I(1,1,:)) > 1
    temp_I = I(:,:,1);
    I=temp_I;
end
I = double(I);
unblur_I = imread('./article_research/lena_3_4.png');
if length(unblur_I(1,1,:)) > 1
    temp_I = unblur_I(:,:,1);
    unblur_I=temp_I;
end
unblur_I = double(unblur_I);
% result = sqrt(1 / length(I(:, 1)) / length(I(1, :)) * sum(sum((I - unblur_I).^2)));

shift = 9;
sum = 0;
count = 0;
for i = shift : 1 : (length(I(:, 1)) - shift)
    for j = shift : 1 : (length(I(1, :)) - shift)
        sum = sum + (I(i, j) - unblur_I(i, j))^2;
        count = count + 1;
    end;
end;
result = sqrt(1 / count * sum);