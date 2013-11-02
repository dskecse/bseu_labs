Aj = [4; 6; 11; 8; 7; 3; 2];
Bi = [300 400 200 150 400 500 400 300 400];

F = zeros(7, 9);               % it's better to write `length(A)` to reuse the script
for m = 1:7
    for n = 1:9
        F(m,n) = Aj(m,1) * Bi(1,n);
    end
end

f = reshape(F', 1, []);        % `F(:)'` reshapes matrices to vectors columnwise

A = zeros(7, 63);
for j = 1:7
    for i = 1:9
        A(j, i+(j-1)*9) = 1;
    end
end
b = ones(7, 1);

k = 4;
Aeq = zeros(7, 63);
for d = 1:k
    for l = 1:7
        Aeq(d, d+(l-1)*9) = 1;
    end
end
beq = [ones(1, k) zeros(1, 7-k)];

[x, fval, exitflag] = bintprog(f, A, b, Aeq, beq)

X = reshape(full(x), 9, 7)'    % convert sparse matrix to full one
                               % reshape the x vector to 7x9 matrix rowwise
