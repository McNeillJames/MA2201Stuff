% initial value
x = 10;

% max iterations
n = 50;

storageXs = zeros(n, 1);
storageFxs = zeros(n, 1);

for i = 1:n
	% func and derivative at x
	func = x^3 - 3*x^2 + 2*x + 4;
	derivative = 3*x^2 - 6*x + 2;
    
	% store values
	storageXs(i, 1) = x;
    storageFxs(i, 1) = func;
    
	% calculate next
	x = x - (func / derivative);
	
	% stop if we've gotten enough precision
	if i > 1 && abs(storageXs(i, 1) - storageXs(i - 1, 1)) < 10^(-13)
        disp(storageXs(i, 1));
        break;
	end
end

loglog(1:(i - 1), abs(diff(storageXs(1:i))));
hold on
loglog(1:(i), abs(storageFxs(1:i)));
hold off
