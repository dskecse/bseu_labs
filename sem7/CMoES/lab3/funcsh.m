A  = [10 16];
b  = 120;
x0 = [1; 1];
lb = [0; 0];

options = optimoptions('fmincon', 'Algorithm', 'active-set', ...
                                  'Display', 'off');
[x, fval, exitflag] = fmincon(@kd, x0, A, b, [], [], lb, [], [], options)

[X, Y] = meshgrid(0:.2:15);
Z = 2 * X .^ 0.5 .* Y .^ 0.5;
[C, h] = contour(X, Y, Z, [-fval, -fval]);
set(h, 'ShowText', 'on', 'TextStep', get(h, 'LevelStep') * 2)

hold on

Z2 = A(1) * X + A(2) * Y - b;
[C2, h2] = contour(X, Y, Z2, [0 0]);
set(h2, 'ShowText', 'on', 'TextStep', get(h2, 'LevelStep') * 2)

plot(x(1), x(2), 'rs', 'MarkerSize', 8, ...
                       'LineWidth', 2)
