N = 80;

[D,x] = cheb(N - 1);
P = exp(sin(pi*x));
D1 = D;
for i=1:N
    D1(i, i) = P(i, 1) + D(i, i);
end

% clear 1st row except for 1st entry, which will be 1
D1(1, 1) = 1;
for i=2:N
   D1(1, i) = 0;
end

v = zeros(N, 1);
v(1) = 1;

y = D1\v;
plot(x, y);

convX = cos(acos(x) * (0:N-1));
res = convX\y;
loglog(1:N, abs(res));  
