%graphical solution

clear all;
ej = 0.1;
ek = 0.0001;
V = 8.4398;
m = 0;
N = 10000;
n1 = 1.45;
n2 = 1.44;
b = 62.5;
a = 5;
lambda0 = 0.633;
k0 = 2 * pi / lambda0;
temp = zeros(3, 2);

h = V / N;
for i = 1 : N - 1,
    U(i) = i * h;
    W = sqrt(V * V - U(i) * U(i));
    G = U(i) * besselj(m - 1, U(i));
    
    if abs(G) < ej 
        T(i) = 0;
    else 
        T(i) = besselj(m, U(i)) / G;
    end;
    
    G = W * besselk(m - 1, W);
    
    if abs(G) < ek 
        P(i) = 0;
    else 
        P(i) = -besselk(m, W) / G;
    end;
end;
disp('solved');
j = 1;
for i = 1 : length(T)
%     for k = 1 : length(P)
        if abs(T(i) - P(i)) < 0.0002
            disp(U(i))
            temp(1, j) = U(i);
            temp(2, j) = sqrt((k0 * n1)^2 - (U(i)^2) / (a^2));
            temp(3, j) = a * sqrt(temp(2, j)^2 - (k0 * n2)^2);
            j = j + 1;
        end;
%     end;
end;
plot(U,T,'c-',U,P,'g-');