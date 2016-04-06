function [result] = final_solver(I, blur_I)
    length_a = 16;
    new_I = double(I);
    new_blur_I = double(blur_I);
    [X, y] = append_to_x(new_I, new_blur_I, 50);
    while rank(X) ~= length_a
        [X, y] = append_to_x(new_I, new_blur_I, 1, X, y);
    end;
    result = X \ y;
    result = result ./ sum(result);
end

function [X, y] = append_to_x(new_I, new_blur_I, count, X, y)
    if nargin == 3
        start = 0;
    else
        start = length(y);
    end
    min_image_size = min(length(new_I(1,:)), length(new_I(:,1)));
    image_index_i = getRandom(3, min_image_size - 2, count);
    image_index_j = getRandom(3, min_image_size - 2, count);
    for i = 1 : count
        y(start + i, 1) = new_I(image_index_i(i), image_index_j(i));
        src_i = image_index_i(i);
        src_j = image_index_j(i);
        b1 = new_blur_I(src_i, src_j);
        b2 = (new_blur_I(src_i + 1, src_j) + new_blur_I(src_i - 1, src_j) + new_blur_I(src_i, src_j + 1) + new_blur_I(src_i, src_j - 1)) / 4;
        b3 = (new_blur_I(src_i + 1, src_j - 1) + new_blur_I(src_i - 1, src_j + 1) + new_blur_I(src_i + 1, src_j + 1) + new_blur_I(src_i - 1, src_j - 1)) / 4;
        b4 = (new_blur_I(src_i + 2, src_j) + new_blur_I(src_i - 2, src_j) + new_blur_I(src_i, src_j - 2) + new_blur_I(src_i, src_j + 2)) / 4;
        b5 = (new_blur_I(src_i + 1, src_j + 2) + new_blur_I(src_i + 1, src_j - 2) + new_blur_I(src_i - 1, src_j + 2) + new_blur_I(src_i - 1, src_j - 2) + new_blur_I(src_i + 2, src_j - 1) + new_blur_I(src_i + 2, src_j + 1) + new_blur_I(src_i - 2, src_j + 1) + new_blur_I(src_i - 2, src_j - 1)) / 8;
        b6 = (new_blur_I(src_i + 2, src_j - 2) + new_blur_I(src_i - 2, src_j + 2) + new_blur_I(src_i + 2, src_j + 2) + new_blur_I(src_i - 2, src_j - 2)) / 4;
        X(start + i, :) = [b1 b2 b2^2 b2^3 b3 b3^2 b3^3 b4 b4^2 b4^3 b5 b5^2 b5^3 b6 b6^2 b6^3];
    end;
end