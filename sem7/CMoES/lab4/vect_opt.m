c = [100 123]; % product prices
z = [84 117];  % costs
p = c - z;     % income

A  = [54 26; 34 43];
b  = [512; 412];
lb = [0 0];

[x1, f1, exitflag] = linprog(-c, A, b, [], [], lb) % 1st criterion optimum solution
[x2, f2, exitflag] = linprog(-p, A, b, [], [], lb) % 2nd criterion optimum solution

% solution by the least equal deviations method
f = c / f1;
Aeq = f1 * p - f2 * c;
beq = 0;

[x3, f3, exitflag] = linprog(f, A, b, Aeq, beq, lb)
f3 = f3 + 1

% solution by the successive concessions method
P = .02;
df2 = f2 * P;
A(3,:) = -p;
b(3)   = df2 - f2;

[x4, f4, exitflag] = linprog(-c, A, b, [], [], lb)
