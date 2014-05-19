function [] = saver(prefix, I, blur_I, unblur_I, dif)
    imwrite(I, strcat(prefix, '_src.png'));
    imwrite(blur_I, strcat(prefix, '_blur.png'));
    imwrite(unblur_I, strcat(prefix, '_unblur.png'));
    imwrite(dif, strcat(prefix, '_dif.png'));
end