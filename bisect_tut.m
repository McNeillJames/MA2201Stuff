a = -10;
b = 10;

n = 50;

% interval storage
x = zeros(n, 3);

% convergences storage
convergeXs = zeros(n, 1);
convergeFxs = zeros(n, 1);

for i = 1:n
    Fa = -(a)^2 - a;
    Fb = -(b)^2 - b;
    
    x(i, 1) = b - a;
    
    c = (a + b)/2;
    convergeXs(i) = c;
    
    Fc = -(c)^2 - c;
    convergeFxs(i) = Fc;
    
    % let a be c if Fc and Fa are on the same side of 0
    if Fc * Fa > 0
        a = c;
    else
        b = c;
    end
    
    x(i, 2) = b - a;
    
    x(i, 3) = x(i, 2) / x(i, 1);
    
    % stop if we have the precision we want
    if abs(x(i, 1)) < 10^(-13)
        disp(convergeXs(i, 1));
        break;
    end
end

loglog(1:(i - 1), abs(diff(convergeXs(1:i))));
hold on
loglog(1:(i), abs(convergeFxs(1:i)), 'r');
hold off

