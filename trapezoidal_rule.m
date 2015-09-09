
n = 10000;

% lower and upper limits
x_0 = 1;
x_n = 5;


convf = zeros(n, 1);

% pre construct most of weights
w = ones(n, 1);

% i is number of divisions
for i=1:n
    h = (x_n - x_0) / i;
    
    x = linspace(x_0, x_n, i+1);
    
    % result of each term
    FxValues = Fx(x);
    
    weights = [0.5; w(1:i-1); 0.5];
    
    area = sum(h * FxValues * weights);

    convf(i) = area;
    
end
loglog(1:n-1, abs(diff(convf(1:n))));