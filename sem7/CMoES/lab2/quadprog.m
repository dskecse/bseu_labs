n = 8; maxv = 55; minv = 0; v0 = 5;
p = [30 14 30 40 25 35 10 20];
Mp = mean(p);

H = 2 * eye(n);
f = -2 * Mp * ones(n, 1);

% Sx = ones(n, 1);
s = cumsum(p);
lb = (v0 - maxv) + s;
ub = (v0 - minv) + s;

L = tril(ones(n));
Hnew = inv(L)' * H * inv(L);
fnew = -(inv(L)' * f);

[y, fvy] = quadprog(Hnew, fnew, [], [], [], [], lb, ub)
x = inv(L) * y
fvy += n * Mp^2
