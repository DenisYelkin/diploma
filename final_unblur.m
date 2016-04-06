function [result] = final_unblur(blur_I, a)
    result = blur_I;
    temp = double(result);
    for i = 4 : length(blur_I(:,1)) - 3
        for j = 4 : length(blur_I(1,:)) - 3
            b1 = temp(i, j);
            b2 = (temp(i + 1, j) + temp(i - 1, j) + temp(i, j + 1) + temp(i, j - 1)) / 4;
            b3 = (temp(i + 1, j - 1) + temp(i - 1, j + 1) + temp(i + 1, j + 1) + temp(i - 1, j - 1)) / 4;
            b4 = (temp(i + 2, j) + temp(i - 2, j) + temp(i, j - 2) + temp(i, j + 2)) / 4;
            b5 = (temp(i + 1, j + 2) + temp(i + 1, j - 2) + temp(i - 1, j + 2) + temp(i - 1, j - 2) + temp(i + 2, j - 1) + temp(i + 2, j + 1) + temp(i - 2, j + 1) + temp(i - 2, j - 1)) / 8;
            b6 = (temp(i + 2, j - 2) + temp(i - 2, j + 2) + temp(i + 2, j + 2) + temp(i - 2, j - 2)) / 4;
            b7 = (temp(i + 3, j + 3) + temp(i + 3, j - 3) + temp(i - 3, j + 3) + temp(i - 3, j - 3)) / 4;
            func = [1 b2 b3 b4 b5 b6 b7 ...
                b2*b2 b2*b3 b2*b4 b2*b5 b2*b6 b2*b7 ...
                b3*b3 b3*b4 b3*b5 b3*b6 b3*b7 ...
                b4*b4 b4*b5 b4*b6 b4*b7 ...
                b5*b5 b5*b6 b5*b7 ...
                b6*b6 b6*b7 ...
                b7*b7];
            result(i, j) = sum(func .* a');
        end
    end
end