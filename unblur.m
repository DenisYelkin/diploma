function [result] = unblur(blur_I, a)
    result = blur_I;
    temp = double(result);
    for i = 4 : length(blur_I(:,1)) - 3
        for j = 4 : length(blur_I(1,:)) - 3
%             sum =(temp(i - 1, j) + temp(i, j - 1) + temp(i + 1, j) + temp(i, j + 1)) / 4;
%             sum_2 = (temp(i - 1, j - 1) + temp(i + 1, j - 1) + temp(i + 1, j + 1) + temp(i - 1, j + 1)) / 4;
%             result(i,j) = a(1) + a(2)*blur_I(i,j) + round(a(3)*sum + a(5)*(sum^2) + a(4)*sum_2 + a(6)*(sum_2^2));
            b0 = 1;
            b1 = temp(i, j);
            b2 = (temp(i + 1, j) + temp(i - 1, j) + temp(i, j + 1) + temp(i, j - 1)) / 4;
            b3 = (temp(i + 1, j - 1) + temp(i - 1, j + 1) + temp(i + 1, j + 1) + temp(i - 1, j - 1)) / 4;
            b4 = (temp(i + 2, j) + temp(i - 2, j) + temp(i, j - 2) + temp(i, j + 2)) / 4;
            b5 = (temp(i + 1, j + 2) + temp(i + 1, j - 2) + temp(i - 1, j + 2) + temp(i - 1, j - 2) + temp(i + 2, j - 1) + temp(i + 2, j + 1) + temp(i - 2, j + 1) + temp(i - 2, j - 1)) / 8;
            b6 = (temp(i + 2, j - 2) + temp(i - 2, j + 2) + temp(i + 2, j + 2) + temp(i - 2, j - 2)) / 4;
            b7 = (temp(i + 3, j) + temp(i - 3, j) + temp(i, j - 3) + temp(i, j + 3)) / 4;
            b8 = (temp(i + 1, j + 3) + temp(i + 1, j - 3) + temp(i - 1, j + 3) + temp(i - 1, j - 3) + temp(i + 3, j - 1) + temp(i + 3, j + 1) + temp(i - 3, j + 1) + temp(i - 3, j - 1)) / 8;
            switch length(a)
                case 6
                    result(i, j) = round(b0 * a(1) + b1 * a(2) + b2 * a(3) + b2^2 * a(4) + b3 * a(5) + b3^2 * a(6));
                case 8
                    result(i, j) = round(b0 * a(1) + b1 * a(2) + b2 * a(3) + b2^2 * a(4) + b3 * a(5) + b3^2 * a(6) + b4 * a(7) + b4^2 * a(8));
                case 10
                    result(i, j) = round(b0 * a(1) + b1 * a(2) + b2 * a(3) + b2^2 * a(4) + b3 * a(5) + b3^2 * a(6) + b4 * a(7) + b4^2 * a(8) + b5 * a(9) + b5^2 * a(10));
                case 12
                    result(i, j) = round(b0 * a(1) + b1 * a(2) + b2 * a(3) + b2^2 * a(4) + b3 * a(5) + b3^2 * a(6) + b4 * a(7) + b4^2 * a(8) + b5 * a(9) + b5^2 * a(10) + b6 * a(11) + b6^2 * a(12));
                case 14
                    result(i, j) = round(b0 * a(1) + b1 * a(2) + b2 * a(3) + b2^2 * a(4) + b3 * a(5) + b3^2 * a(6) + b4 * a(7) + b4^2 * a(8) + b5 * a(9) + b5^2 * a(10) + b6 * a(11) + b6^2 * a(12) + b7 * a(13) + b7^2 * a(14));
                case 16
                    result(i, j) = round(b0 * a(1) + b1 * a(2) + b2 * a(3) + b2^2 * a(4) + b3 * a(5) + b3^2 * a(6) + b4 * a(7) + b4^2 * a(8) + b5 * a(9) + b5^2 * a(10) + b6 * a(11) + b6^2 * a(12) + b7 * a(13) + b7^2 * a(14) + b8 * a(15) + b8^2 * a(16));
            end
        end
    end
end