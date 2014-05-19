function [result] = getRandom(min, max, cnt)
    result = randi([min, max], 1, cnt);
end