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
    delta = 0.001;
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
    %x=sort(x);
    %x = round(x);
    
    
  %  plot(th_x, y, 'r');
    
    x = th_x;
    y = y;
    max_y = max(y);
    length = size(x, 2);
    for i = 1 : length
        if (max_y/y(i) < 100) %100 or another number?
            i_start = i;        
            break;
        end;
    end;
    for i = length : -1 : 1
        if (max_y/y(i) < 100) %100 or another number?
            i_end = i;        
            break;
        end;
    end;
    i_cent = round((i_start + i_end) / 2);
    Mksi = x(i_cent);     
    sigma = (x(i_end) - x(i_cent)) / 3 ;
    Dksi = sigma * sigma;
    count = 2; % expected number of quantities
    M_vect = zeros (count, 1);
    for i = 1 : count
        M_vect(i) = Mksi - 3 * sigma + 3 * sigma / count + 6 * sigma * (i-1) / count;
    end;
    summ = 0;
    for i = 1 : count
        summ = summ + M_vect(i) * M_vect(i) / count;
    end;
    D_const = abs(Dksi + Mksi * Mksi - summ);
    D_vect = zeros(count, 1);
    P_vect = zeros(count, 1);
    for i = 1 : count
        D_vect(i) = D_const;
        P_vect(i) = 1 /count;
    end;
    p_vect_res = P_vect;
    m_vect_res = M_vect;  
       for i = 1 : count
           p_vect_res(i) = P_i(i, x, M_vect, D_vect, P_vect, length, count);
          m_vect_res(i) = M_i(i, x, M_vect, D_vect, P_vect, length, count);
       end;         
 %   m_vect_res

   
 