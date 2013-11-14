% Linear Discriminant Analysis (LDA) example
% initial data representation in the form of matrices
m1 = [1.8 5.1 10.7;
      2   0.3 11.4;
      3.5 4.8 10.3;
      2.7 3.2 13.8;
      3   5.4 12.1];

m2 = [6.9  10.2 17.8;
      10.1 11.1 18;
      7.7  12.3 19.2;
      8.6  12.7 16.7;
      9.4  13.1 16.9];

m0 = [9.2 14   17.5;
      8.3 13.5 20;
      2.5 5.8  11.6;
      7.1 11.2 19.4;
      3.2 6.4  12];

% total number of all objects (in all subsets)
n1 = length(m1);
n2 = length(m2);
m  = length(m0);
n  = m + n1 + n2

% each attrbute of k subset mean values
x1 = mean(m1)
x2 = mean(m2)
x0 = mean(m0)

% vector-columns
x1t = x1'
x2t = x2'

% calculate covariation matrices of all the learning sets
c1 = cov(m1)
c2 = cov(m2)

% joint covariance matrix calculation
c = (n1 * c1 + n2 * c2) / (n1 + n2)

% calculate inverted matrix of the previous one
cinv = inv(c)

a = cinv * (x1t - x2t)

y1 = m1 * a
y2 = m2 * a

% average values
y1avg = mean(y1)
y2avg = mean(y2)

% calculate discrimination constant
y = mean([y1avg y2avg])

% make discrimination of m0 set objects
y0 = m0 * a
choice = y0 - y

for i = 1:n2
    if y1avg > y2avg
        if choice(i) > 0
            disp(['object x' num2str(i) ' belongs to set 1'])
        else
            disp(['object x' num2str(i) ' belongs to set 2'])
        end
    elseif y1avg < y2avg
        if choice(i) < 0
            disp(['object x' num2str(i) ' belongs to set 1'])
        else
            disp(['object x' num2str(i) ' belongs to set 2'])
        end
    end
end

% 2nd way
% vector x covariance matrix estimation
E = (n1 * c1 + n2 * c2) / (n1 + n2 - 2);

% applying a classification rule
for i = 1:n2
    M(i) = (m0(i,:) - (x1 + x2) / 2) * inv(E) * (x1 - x2)';
end

for i = 1:n2
    if M(i) >= 0
        disp(['object x' num2str(i) ' belongs to set 1'])
    else
        disp(['object x' num2str(i) ' belongs to set 2'])
    end
end

[p1, p2, p3] = meshgrid(0:11, 0:15, 0:21);
plot3(m1(:,1), m1(:,2), m1(:,3), 'g.', 'MarkerSize', 6, 'LineWidth', 2)
hold on

plot3(x1(1), x1(2), x1(3), 'g*', 'MarkerSize', 7)        % center of the 1st set
plot3(m2(:,1), m2(:,2), m2(:,3), 'r.', 'MarkerSize', 6, 'LineWidth', 2)
plot3(x2(1), x2(2), x2(3), 'r*', 'MarkerSize', 7)        % center of the 2nd set
plot3(m0(:,1), m0(:,2), m0(:,3), 'b.', 'MarkerSize', 6, 'LineWidth', 2)
grid on

for i=1:5
    for j=1:3
        dev1(i,j) = abs(m1(i,j) - x1(j));    % deviations
        dev2(i,j) = abs(m1(i,j) - x2(j));
    end
end

for i=1:3
    for j=1:5
        rad1(i) = max(dev1(:,i)) * 1.3;      % radii
        rad2(i) = max(dev2(:,i)) * 0.5;
    end
end

[X, Y, Z] = ellipsoid(x1(1), x1(2), x1(3), rad1(1), rad1(2), rad1(3));
mesh(X, Y, Z);
hidden off

[X, Y, Z] = ellipsoid(x2(1), x2(2), x2(3), rad2(1), rad2(2), rad2(3));
mesh(X, Y, Z);
hidden off
colormap gray
