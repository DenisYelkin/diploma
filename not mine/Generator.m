    fileID = fopen('data.txt');
    formatSpec = '%f %f %f';
    sizeA = [3 Inf];
    A = fscanf(fileID, formatSpec, sizeA);
    A=A';
    [row, col] = size(A);
    m = zeros(row, 1);
    d = zeros(row, 1);
    temp = zeros(row, 1);
    for i=1:row,
        m(i) = A(i,1);
        d(i) = A(i,2);
        temp(i) = A(i,3);
    end
    delta = 0.01;
    if (sum(temp) - 1.0 > delta)
        errordlg('Сумма вероянтностей не равна 1');
        return;
    end
    N = 2;
    n=500; % ?
    x = zeros(1,row * n);
    
    for i = 1 : row
        mx = m(i);
        dx = d(i);
        for j= 1 : n
            x(j + n * (i-1)) = (sum(rand(1,12)) - 6)*sqrt(dx) + mx;
        end
    end
    th_x=0:0.01:max(x);
    th_y = zeros(row, size(th_x,2));
    for i = 1 : row
        mx = m(i);
        dx = d(i);
        y_sc = normpdf(th_x,mx,sqrt(dx)); 
        th_y(i, :) = y_sc * temp(i);
    end
    
    y = zeros(1, size(th_x,2));
    for i = 1 : size(th_x,2)
        y(1,i) = sum (th_y(:, i));
    end
    x=sort(x);
    x = round(x);
    
    
    plot(th_x, y, 'r');
 