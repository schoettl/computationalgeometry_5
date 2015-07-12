% Linear Programming
% Find biggest circle within a convex polygon
% Author: Jakob Schöttl

%data = importdata('testpolygon.txt'); cw = false;
data = importdata('polygon.txt'); cw = true;
%cw = ispolycw(data(:, 1), data(:, 2)); % Undefined function or variable 'ispolycw'. (in MATLAB R2015a??)

if cw
  data = flipud(data)
end

nPoints = size(data, 1);
if all(data(1, :) == data(nPoints, :))
  nPoints = nPoints - 1;
else
  data = [ data; data(1, :) ];
end

% solve linear programming problem:
% min f x such that A x <= b
% while x = [ x y r ]

f = [ 0 0 -1 ];

% Randbedingungen: Radius <= Abstand Gerade (P1, P2) zu Mittelpunkt (x, y)

A = zeros(nPoints, 3);
b = zeros(nPoints, 1);

for i = 1:nPoints
  p = data(i, :);
  q = data(i+1, :);
  
  n = [ q(1) - p(1), q(2) - p(2) ];
  n = [ -n(2), n(1) ];
  n = n / norm(n);
  c = n * transpose(p);
  
  %       n(1) x + n(2) y - r >= c
  % <=> - n(1) x - n(2) y + r <= -c
  A(i, :) = [ -n, 1 ];
  b(i) = -c;
end

linprog(f, A, b)

% expected result for testpolygon.txt: x = 5, y = 5, r = 5
