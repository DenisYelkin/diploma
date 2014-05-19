function [  ] = draw( M_iter, Sigma_iter)

sizeM = size(M_iter); 
sizeM = sizeM(2);
sizeS = size(Sigma_iter);
sizeS = sizeS(2);
count = 1;
hold on;
for i = 1 : sizeM    
        jj = 1 : 1 : 1000;        
    subplot (2, sizeM, count);
    plot(jj, M_iter(:, i));    
    count = count + 1;
    subplot (2, sizeM, count);
    plot(jj, Sigma_iter(:, i));
    count = count + 1;
end;


end

