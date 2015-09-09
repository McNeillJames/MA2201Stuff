mymat = zeros(3, 3);

mymat(1, 1) = 3;
mymat(2, 1) = 5;
mymat(3, 1) = 2;
mymat(1, 2) = 1;
mymat(2, 2) = 2;
mymat(3, 2) = 6;
mymat(1, 3) = 0;
mymat(2, 3) = 2;
mymat(3, 3) = 2;

aug = zeros(3);

aug(1) = 5;
aug(2) = 2;
aug(3) = 1;
disp(aug);
res = guassElim(mymat, aug);
disp(mymat);
disp(aug);
disp(res);