clear;
clc;

n = 10000;

x_0 = 1;
x_n = 5;

convf = zeros(n / 2 - 1, 1);

% iterator for storage vector
k = 1;
for i = 3:2:n
    % i is number of x points
    h = (x_n - x_0) / (i - 1);
    
    allXs = linspace(x_0, x_n, i);
    
    terms = Fx(allXs);
    % get the length of terms vector
    sizes = size(terms);
    sizeOfTerms = sizes(2);
    for j = 2:sizeOfTerms-1
        % alternate multiplying by 4 and 2
        if mod(j, 2) == 0
            terms(j) = terms(j) * 4;
        else
            terms(j) = terms(j) * 2;
        end
    end
    area = h / 3 * (sum(terms));
    
    convf(k, 1) = area;
    k = k + 1;
end
loglog(1:n / 2 - 2, abs(diff(convf(1:n / 2 - 1))));