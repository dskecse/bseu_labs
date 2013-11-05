n = 8; maxv = 55; minv = 0; v0 = 5;
P = [30 14 30 40 25 35 10 20];
Mp = mean(P);

s = cumsum(P);
L = tril(ones(n));

H = 2 * eye(n);
Hnew = inv(L)' * H * inv(L);
f = -2 * Mp * ones(n, 1);
fnew = inv(L)' * f;

lb = (v0 - maxv) + s;
ub = (v0 - minv) + s;

options = optimoptions('quadprog', 'Algorithm', 'active-set', 'Display', 'off');
[y, fvy, exitflag] = quadprog(Hnew, fnew, [], [], [], [], lb, ub, [], options)

x = inv(L) * y
Fv = fvy + n * Mp^2
