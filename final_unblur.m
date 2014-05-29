function [result] = final_unblur(blur_I, a)
    result = blur_I;
    temp = double(result);
    for i = 3 : length(blur_I(:,1)) - 2
        for j = 3 : length(blur_I(1,:)) - 2
            b1 = temp(i, j);
            b2 = (temp(i + 1, j) + temp(i - 1, j) + temp(i, j + 1) + temp(i, j - 1)) / 4;
            b3 = (temp(i + 1, j - 1) + temp(i - 1, j + 1) + temp(i + 1, j + 1) + temp(i - 1, j - 1)) / 4;
            b4 = (temp(i + 2, j) + temp(i - 2, j) + temp(i, j - 2) + temp(i, j + 2)) / 4;
            b5 = (temp(i + 1, j + 2) + temp(i + 1, j - 2) + temp(i - 1, j + 2) + temp(i - 1, j - 2) + temp(i + 2, j - 1) + temp(i + 2, j + 1) + temp(i - 2, j + 1) + temp(i - 2, j - 1)) / 8;
            b6 = (temp(i + 2, j - 2) + temp(i - 2, j + 2) + temp(i + 2, j + 2) + temp(i - 2, j - 2)) / 4;
            result(i, j) = round(b1 * a(1) + b2 * a(2) + b2^2 * a(3) + b2^3 * a(4) + b3 * a(5) + b3^2 * a(6) + b3^3 * a(7) + b4 * a(8) + b4^2 * a(9) + b4^3 * a(10) + b5 * a(11) + b5^2 * a(12) + b5^3 * a(13) + b6 * a(14) + b6^2 * a(15) + b6^3 * a(16));
        end
    end
end