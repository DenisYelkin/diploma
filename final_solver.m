function [result] = final_solver(I, blur_I, samples_count)
    length_a = 20;
    new_I = double(I);
    new_blur_I = double(blur_I);
    X = zeros(samples_count, length_a);
    iter = 0;
    while rank(X) ~= length_a
        y = zeros(samples_count, 1);
        min_image_size = min(length(I(1,:)), length(I(:,1)));
        image_index_i = getRandom(4, min_image_size - 3, samples_count);
        image_index_j = getRandom(4, min_image_size - 3, samples_count);
        for i = 1 : samples_count
            y(i, 1) = new_I(image_index_i(i), image_index_j(i));
            src_i = image_index_i(i);
            src_j = image_index_j(i);
            b1 = new_blur_I(src_i, src_j);
            b2 = (new_blur_I(src_i + 1, src_j) + new_blur_I(src_i - 1, src_j) + new_blur_I(src_i, src_j + 1) + new_blur_I(src_i, src_j - 1)) / 4;
            b3 = (new_blur_I(src_i + 1, src_j - 1) + new_blur_I(src_i - 1, src_j + 1) + new_blur_I(src_i + 1, src_j + 1) + new_blur_I(src_i - 1, src_j - 1)) / 4;
            b4 = (new_blur_I(src_i + 2, src_j) + new_blur_I(src_i - 2, src_j) + new_blur_I(src_i, src_j - 2) + new_blur_I(src_i, src_j + 2)) / 4;
            b5 = (new_blur_I(src_i + 1, src_j + 2) + new_blur_I(src_i + 1, src_j - 2) + new_blur_I(src_i - 1, src_j + 2) + new_blur_I(src_i - 1, src_j - 2) + new_blur_I(src_i + 2, src_j - 1) + new_blur_I(src_i + 2, src_j + 1) + new_blur_I(src_i - 2, src_j + 1) + new_blur_I(src_i - 2, src_j - 1)) / 8;
            b6 = (new_blur_I(src_i + 2, src_j - 2) + new_blur_I(src_i - 2, src_j + 2) + new_blur_I(src_i + 2, src_j + 2) + new_blur_I(src_i - 2, src_j - 2)) / 4;
            b7 = (new_blur_I(src_i + 3, src_j + 3) + new_blur_I(src_i + 3, src_j - 3) + new_blur_I(src_i - 3, src_j + 3) + new_blur_I(src_i - 3, src_j - 3)) / 4;
            X(i, :) = [1 b1 b2 b3 b4 b5 b6 b7 ...
                b2^2 b2^3 ...
                b3^2 b3^3 ...
                b4^2 b4^3 ...
                b5^2 b5^3 ...
                b6^2 b6^3 ...
                b7^2 b7^3];
        end;       
        iter = iter + 1;
        disp(iter);
        disp(rank(X));
    end;
    result = X \ y;
%     result = result ./ sum(result);
end