function [result] = final_solver1(I, blur_I)
    mask_size = 5;
    length_a = 30;
    row_len = length_a * mask_size * 2;
    samples_count = row_len^2;
    new_I = double(I);
    new_blur_I = double(blur_I);
    X = zeros(samples_count, length_a);
    iter = 0;
    while rank(X) ~= length_a
        y = zeros(samples_count, 1);
        src_i = 5;
        src_j = 5;
        for i = 1 : samples_count
            y(i, 1) = new_I(src_i, src_j);
            b1 = new_blur_I(src_i, src_j);
            b2 = (new_blur_I(src_i + 1, src_j) + new_blur_I(src_i - 1, src_j) + new_blur_I(src_i, src_j + 1) + new_blur_I(src_i, src_j - 1)) / 4;
            b3 = (new_blur_I(src_i + 1, src_j - 1) + new_blur_I(src_i - 1, src_j + 1) + new_blur_I(src_i + 1, src_j + 1) + new_blur_I(src_i - 1, src_j - 1)) / 4;
            b4 = (new_blur_I(src_i + 2, src_j) + new_blur_I(src_i - 2, src_j) + new_blur_I(src_i, src_j - 2) + new_blur_I(src_i, src_j + 2)) / 4;
            b5 = (new_blur_I(src_i + 1, src_j + 2) + new_blur_I(src_i + 1, src_j - 2) + new_blur_I(src_i - 1, src_j + 2) + new_blur_I(src_i - 1, src_j - 2) + new_blur_I(src_i + 2, src_j - 1) + new_blur_I(src_i + 2, src_j + 1) + new_blur_I(src_i - 2, src_j + 1) + new_blur_I(src_i - 2, src_j - 1)) / 8;
            b6 = (new_blur_I(src_i + 2, src_j - 2) + new_blur_I(src_i - 2, src_j + 2) + new_blur_I(src_i + 2, src_j + 2) + new_blur_I(src_i - 2, src_j - 2)) / 4;
%             X(i, :) = [b1...
%                 b2 b2^2 b2^3 ...
%                 b3 b3^2 b3^3 ...
%                 b4 b4^2 b4^3 ...
%                 b5 b5^2 b5^3 ...
%                 b6 b6^2 b6^3];
            X(i, :) = [b2 b3 b4 b5 b6 ...
                b2*b2 b2*b3 b2*b4 b2*b5 b2*b6 ...
                b3*b2 b3*b3 b3*b4 b3*b5 b3*b6 ...
                b4*b2 b4*b3 b4*b4 b4*b5 b4*b6 ...
                b5*b2 b5*b3 b5*b4 b5*b5 b5*b6 ...
                b6*b2 b6*b3 b6*b4 b6*b5 b6*b6];
            src_i = src_i + 1;
            if src_i > (row_len + 5)
                src_j = src_j + 1;
                src_i = 5;
            end;
        end;       
        iter = iter + 1;
        disp(iter);
    end;
    result = X \ y;
%     result = result ./ sum(result);
end