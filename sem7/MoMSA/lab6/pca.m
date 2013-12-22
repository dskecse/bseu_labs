% Principal Component Analysis (PCA) example
% format short g

X = [0.26 0.27 1.46 58.42  19074 0.73 82.44  18.29;
     0.31 0.45 1.36 63.99  27404 0.85 137.52 18.28;
     0.29 0.40 1.28 91.43  34873 0.80 76.32  16.83;
     0.24 0.56 1.20 32.87  12243 0.96 131.76 22.62;
     0.51 0.16 1.26 13.58  7612  0.76 156.96 19.13;
     0.25 0.33 1.47 123.68 29626 0.71 52.00  16.87;
     0.02 0.42 1.35 258.62 58947 0.52 85.32  18.83;
     0.38 0.30 1.40 53.37  21955 0.76 0.82   22.17;
     0.37 0.31 1.15 104.55 39648 0.79 135.72 28.23;
     0.23 0.42 1.51 184.33 39250 0.52 90.72  22.09;
     0.31 0.29 1.35 37.21  11688 0.74 107.64 14.63;
     0.18 0.32 1.41 75.66  94697 0.48 101.00 19.70;
     0.36 0.64 1.27 27.29  17306 0.99 107.64 17.98;
     0.31 0.42 1.15 45.63  20193 0.89 116.64 26.44;
     0.29 0.38 1.43 49.63  17500 0.62 120.96 26.20;
     0.51 0.20 1.47 17.16  11238 0.74 153.00 30.53;
     0.16 0.08 1.87 222.11 43799 0.81 155.52 12.39;
     0.27 0.37 1.27 59.40  18452 0.64 79.92  26.05;
     0.01 0.35 1.50 391.27 7888  0.51 84.60  17.26;
     0.42 0.26 1.09 48.41  20122 0.67 138.24 22.26]

avg    = mean(X);
sigma  = sqrt(var(X))
[n, p] = size(X);
for i = 1:n
    for j = 1:p
        Z(i,j) = (X(i,j) - avg(j)) / sigma(j);
    end
end
Z

R = (Z' * Z) / (n - 1)
[V, lambdas] = eig(R)   % V here, not U. V is already normalized
A = V * sqrt(lambdas)   % factor matrix

for r = 1:8
    portion = lambdas(r,r) / 8 * 100;
    disp(['F' int2str(r) ' principal component explains ' num2str(portion) ...
      '% of total dispersion of initial indices'])
end % vybiraem F6, F7, F8 (lambda(s) >= 1) tak kak summa dolei dispersii sostavlyaet 71.3% ~ 75%

% znacheniya glavnyx komponent po vsem objektam nabliudeniya
% ajr^2 - velichina dispersii isxodnogo j-go pokazatelya, objasnyaemogo r-toi glavnoi komponentoi
A(:,6:8) .^ 2
