function [result] = addLight(img)
    min_val = min(min(img));
    result = img - min_val;
    delta = max(max(result));
    result = uint8(result*255/delta);
end