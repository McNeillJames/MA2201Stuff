N = 50;

[D,x] = cheb(N - 1);

D1 = D + 2*eye(N);
% clear 1st row except for 1st entry, which will be 1
D1(1, 1) = 1;
for i=2:N
   D1(1, i) = 0;
end

v = zeros(N, 1);
v(1) = 1;

y = D1\v;

exactX = linspace(-1, 1, 2050);
exactY = exp(-2*(1+exactX));
plot(x, y, exactX, exactY, 'r');
