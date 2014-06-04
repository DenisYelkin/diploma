function [result] = difference(src_I, unblur_I)
    result = addLight(abs(255 - double(src_I) + double(unblur_I)));
end