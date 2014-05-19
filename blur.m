function [result] = blur(I, a0, a1, a2, a3, a4, a5, z0, z1)
    result = I;
    temp = double(I);
%     for i = 3 : length(I(:, 1)) - 2
%         for j = 3 : length(I(1, :)) - 2
%             b0 = a0;
%             b1 = a1 * temp(i, j);
%             b2 = a2 * (temp(i + 1, j) + temp(i - 1, j) + temp(i, j + 1) + temp(i, j - 1)) / 4;
%             b3 = a3 * (temp(i + 1, j - 1) + temp(i - 1, j + 1) + temp(i + 1, j + 1) + temp(i - 1, j - 1)) / 4;
%             b4 = a4 * (temp(i + 2, j) + temp(i - 2, j) + temp(i, j - 2) + temp(i, j + 2)) / 4;
%             b5 = a5 * (temp(i + 1, j + 2) + temp(i + 1, j - 2) + temp(i - 1, j + 2) + temp(i - 1, j - 2) + temp(i + 2, j - 1) + temp(i + 2, j + 1) + temp(i - 2, j + 1) + temp(i - 2, j - 1)) / 8;
%             result(i, j) = round(b0 + b1 + b2 + b3 + b4 + b5);
%         end
%     end

    second_quadrant = double(I);
    for i = 2 : length(I(:, 1))
        for j = 2 : length(I(1, :))
            b0 = (second_quadrant(i - 1, j) + second_quadrant(i, j - 1)) / 2;
            b1 = second_quadrant(i - 1, j - 1);
            b2 = temp(i, j);
            b3 = (temp(i - 1, j) + temp(i, j - 1)) / 2;
            b4 = temp(i - 1, j - 1);
            second_quadrant(i, j) = round(z0*b0 + z1*b1 + a0*b2 + a1*b3 + a2*b4);
        end;
    end;
    disp('second quadrant solved');
    first_quadrant = double(I);
    for i = 2 : length(I(:, 1))
        for j = length(I(1, :)) - 1 : -1 : 1
            b0 = (first_quadrant(i - 1, j) + first_quadrant(i, j + 1)) / 2;
            b1 = first_quadrant(i - 1, j + 1);
            b2 = temp(i, j);
            b3 = (temp(i - 1, j) + temp(i, j + 1)) / 2;
            b4 = temp(i - 1, j + 1);
            first_quadrant(i, j) = round(z0*b0 + z1*b1 + a0*b2 + a1*b3 + a2*b4);
        end;
    end;
    disp('first quadrant solved');
    third_quadrant = double(I);
    for i = length(I(:, 1)) - 1 : -1 : 1
        for j = 2 : length(I(1, :))
            b0 = (third_quadrant(i + 1, j) + third_quadrant(i, j - 1)) / 2;
            b1 = third_quadrant(i + 1, j - 1);
            b2 = temp(i, j);
            b3 = (temp(i + 1, j) + temp(i, j - 1)) / 2;
            b4 = temp(i + 1, j - 1);
            third_quadrant(i, j) = round(z0*b0 + z1*b1 + a0*b2 + a1*b3 + a2*b4);
        end;
    end;
    disp('third quadrant solved');
    fourth_quadrant = double(I);
    for i = length(I(:, 1)) - 1 : -1 : 1
        for j = length(I(1, :)) - 1 : -1 : 1
            b0 = (fourth_quadrant(i + 1, j) + fourth_quadrant(i, j + 1)) / 2;
            b1 = fourth_quadrant(i + 1, j + 1);
            b2 = temp(i, j);
            b3 = (temp(i + 1, j) + temp(i, j + 1)) / 2;
            b4 = temp(i + 1, j + 1);
            fourth_quadrant(i, j) = round(z0*b0 + z1*b1 + a0*b2 + a1*b3 + a2*b4);
        end;
    end;
    disp('fourth quadrant solved');
    result = uint8(round((first_quadrant + second_quadrant + third_quadrant + fourth_quadrant) / 4));
end