  warning off;
fileID = fopen('data.txt');
    formatSpec = '%f %f %f';
    sizeA = [3 Inf];
    A = fscanf(fileID, formatSpec, sizeA);
    A=A';
    [row, col] = size(A);
    m = zeros(row, 1);
    d = zeros(row, 1);
    p = zeros(row, 1);
    for i=1:row,
        m(i) = A(i,1);
        d(i) = A(i,2);
        p(i) = A(i,3);
    end
    delta = 0.001;
    if (sum(p) - 1.0 > delta)
        errordlg('����� ������������� �� ����� 1');
        return;
    end
    sigma = zeros(1,1,row);
    for i = 1 : row
        sigma(1,1,i) = d(i);
    end;   
    obj = gmdistribution(m, sigma, p);
    N = row;
    n=500; % ?
    x = obj.random(n); 
    min_x = min(x);
    max_x = max(x);
    x = sort(x);
    y = pdf(obj, x); 
    
    hold on;
    plot(x, y, '-r');
    count_classes = 2;    
    mu = zeros (count_classes, 1);
    Sigma = zeros (1,1,count_classes);
    Mksi = x(round(n/2));
    temp_sigma = (x(n) - Mksi) / 3;
    for i = 1 : count_classes
        mu(i) = Mksi - 3 * temp_sigma + 3 * temp_sigma / count_classes + 6 * temp_sigma * (i-1) / count_classes;
        Sigma(1,1,i) = temp_sigma;
    end;
    S = struct('PComponents',ones(1,count_classes)/count_classes,'mu', mu,'Sigma',Sigma);
    M_iter = zeros (100,count_classes);
    Sigma_iter = zeros (100, count_classes);
    
    for i = 1 : 100
        options = statset('MaxIter', i);
        result = gmdistribution.fit(x, count_classes, 'CovType', 'diagonal', 'Start', S, 'Options', options);
        for j = 1 :count_classes
            M_iter(i,j) = result.mu(j);
            Sigma_iter(i,j) = result.Sigma(1,1,j);
        end;
    end;
   % result = obj;
    m_res = result.mu;
    p_res = result.PComponents;
    temp = result.Sigma;
    d_res = zeros(count_classes, 1);
    for i = 1 : count_classes
        d_res(i) = temp(1,1,i);
    end;
    d_res = sqrt(d_res);
    X_res = min_x - 5 : 0.01 : max_x + 5;
    Y_res = zeros(n, 1);
    for i = 1 : count_classes     
        Y_res = normpdf(X_res, m_res(i), d_res(i));
        plot(X_res, Y_res * p_res(i));
    end;
