A  = [10 15 9];
b  = 100;
x0 = [1; 1; 1];
lb = [0; 0; 0];

[x, fval, maxval, exitflag] = fminimax(@pv, x0, A, b, [], [], lb)
