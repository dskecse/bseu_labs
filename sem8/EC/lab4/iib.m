% Interregional Interindustry Balance (IIB) example
A1 = [
    0.26 0.14 0.2;
    0.18 0.22 0.1;
    0.15 0.25 0.16
];
A2 = [
    0.32 0.18 0.2;
    0.16 0.2  0.14;
    0.12 0.28 0.1
];
A3 = [
    0.25 0.15 0.1;
    0.28 0.2  0.12;
    0.22 0.33 0.16
];
A = blkdiag(A1, A2, A3)

Y = [
    250 300 360;
    230 320 320;
    200 310 330
];
vector = Y(:)

G = [
    diag([0.24 0.26 0.3]) diag([0.44 0.46 0.48]) diag([0.32 0.28 0.22]);
    diag([0.32 0.4 0.42]) diag([0.5 0.45 0.35]) diag([0.18 0.15 0.23]);
    diag([0.25 0.3 0.35]) diag([0.4 0.45 0.2]) diag([0.35 0.25 0.45])
]

E = eye(size(G));
X = (E - G * A) \ G * vector

lY = G * diag(vector);
I = reshape(nonzeros(lY), 3, 9)';
I1 = I(1:3,:);
I2 = I(4:6,:);
I3 = I(7:9,:);
II = [I1(:) I2(:) I3(:)]    % Yirs

lX = G * A * diag(X)        % Xijrs
s = [lX II X];

dataset({s, 'Region1Branch1', 'Region1Branch2', 'Region1Branch3', ...
            'Region2Branch1', 'Region2Branch2', 'Region2Branch3', ...
            'Region3Branch1', 'Region3Branch2', 'Region3Branch3', ...
            'Region1', 'Region2', 'Region3', 'GrossOutput'}, ...
            'ObsNames', {'Region1Branch1' 'Region1Branch2' 'Region1Branch3' ...
                         'Region2Branch1' 'Region2Branch2' 'Region2Branch3' ...
                         'Region3Branch1' 'Region3Branch2' 'Region3Branch3'})
