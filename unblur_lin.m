function [result] = unblur_lin(blur_I, a)
    result = blur_I;
    temp = double(result);
    for i = 4 : length(blur_I(:,1)) - 3
        for j = 4 : length(blur_I(1,:)) - 3
            b1 = temp(i, j);
            b2 = [temp(i + 1, j) temp(i - 1, j) temp(i, j + 1) temp(i, j - 1)];
            b3 = [temp(i + 1, j - 1) temp(i - 1, j + 1) temp(i + 1, j + 1) temp(i - 1, j - 1)];
            b4 = [temp(i + 2, j) temp(i - 2, j) temp(i, j - 2) temp(i, j + 2)];
            b5 = [temp(i + 1, j + 2) temp(i + 1, j - 2) temp(i - 1, j + 2) temp(i - 1, j - 2) temp(i + 2, j - 1) temp(i + 2, j + 1) temp(i - 2, j + 1) temp(i - 2, j - 1)];
            b6 = [temp(i + 2, j - 2) temp(i - 2, j + 2) temp(i + 2, j + 2) temp(i - 2, j - 2)];
            result(i, j) = round([b1 b2 b3 b4 b5 b6] * a);
        end
    end
end