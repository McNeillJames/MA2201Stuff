function output = guassElim(mat, augment)
    % mat is the matrix being solved, augment is the augment applied to
    % that matrix
    dimensions = size(mat);
    
    % I separated these variables even though them being different would
    % probably screw something anyway :|
    rows = dimensions(0);
    cols = dimensions(1);
    
    % start eliminating in 2nd row
    for i=1:rows-1
        for j=i+1:cols
        mult = mat(i, j) / mat(i, i);
            for k=i+1:n
                mat(j, k) = mat(j, k) - mult * mat(i, k);
            end
            augment(j) = augment(j) - mult * augment(i);
        end
    end
    output = [mat, augment];
end