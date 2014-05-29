function [] = saver(prefix, I, blur_I, unblur_I, dif, lin_unblur_I)
    imwrite(I, strcat(prefix, '_src.png'));
    imwrite(blur_I, strcat(prefix, '_blur.png'));
    imwrite(unblur_I, strcat(prefix, '_unblur.png'));
    imwrite(dif, strcat(prefix, '_dif.png'));
    imwrite(lin_unblur_I, strcat(prefix, '_lun_unblur.png'));
end