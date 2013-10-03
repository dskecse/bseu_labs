A = [4; 6; 11; 8; 7; 3; 2];
b = [300 400 200 150 400 500 400 300 400];

f = zeros(length(A),length(b));
for m = 1:length(A)
    for n = 1:length(b)
        f(m,n) = A(m,1) * b(1,n);
    end
end
% disp(f)

[x, fval] = bintprog(f, A, b);
