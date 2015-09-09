% perform bisection method to find a zero for tan(x)-x
a = 3*pi/2 - 0.4;
b = 3*pi/2 + 0.2;

% max iterations
n = 60;

% interval storage
x = zeros(n, 3);

% convergences storage
convx = zeros(n, 1);
convfx = zeros(n, 1);

for i = 1:n
    fa = tan(a) - a;
    fb = tan(b) - b;

    % old interval
    x(i, 1) = b - a;
    % bisect a and b
    c = (a + b)/2;
    convx(i) = c;
	
    fc = tan(c) - c;
    convfx(i) = fc;
    % if fc and fa are on the same side, replace a with c
    if fc * fa > 0
        a = c;
    else
        b = c;
    end

    % next interval
    x(i, 2) = b - a;
    % ratio of new to old (~0.5)
    x(i, 3) = x(i, 2) / x(i, 1); 
    
	% stop if we have the precision we want
    if abs(x(i, 1)) < 10^(-13) || abs(fc) < 10^(-13)
        break
    end
end
loglog(1:(i - 1), abs(diff(convx(1:i))))
hold on
loglog(1:(i - 1), abs(diff(convfx(1:i))), 'r')
hold off