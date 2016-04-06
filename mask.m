hold on;
x = -4 : 1 : 4;
for i = -4 : 1 : 4
    y = repmat(i, 1, length(x));
    plot(x, y);
    plot(y, x);
end;

x = -4 : 1 : 4;
y = zeros(1, length(x));
plot(x, y, 'k', 'LineWidth', 2);
plot(y, x, 'k', 'LineWidth', 2);
x = -2 : 1 : 2;
for i = -2 : 1 : 2
    y = repmat(i, 1, length(x));
    plot(x, y, 'ok', 'MarkerSize', 6, 'LineWidth', 2);
end;

x = [3 0 -3 0];
y = [0 -3 0 3];
plot(x, y, 'ok', 'MarkerSize', 6, 'LineWidth', 2);


vec = [1, 2, sqrt(2), sqrt(5), sqrt(8), 3];

xc = 0;
yc = 0;
for i = 1 : length(vec)
    r = vec(i);
    theta = linspace(0, 2*pi);
    x = r*cos(theta) + xc;
    y = r*sin(theta) + yc;
    plot(x, y, 'r')
    axis equal
end;
xlim([-4 4]);
ylim([-4 4]);