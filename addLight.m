function [result] = addLight(img)
    min_val = min(min(img));
    result = img - min_val;
    delta = max(max(img));
    for i = 1 : length(result(:, 1))
        for j = 1 : length(result(1, :))
            result(i, j) = round(double(img(i, j)) * 255 / delta);
        end
    end
end