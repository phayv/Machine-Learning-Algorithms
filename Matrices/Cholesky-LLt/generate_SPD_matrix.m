function A = generate_SPD_matrix(n)
    A = rand(n,n); 

    % construct a symmetric matrix, operation count: O(n^2)
    A = A+A';

    % elements A(i,j) <= 1, make diagonally dominant and therefore pos def.
    A = A + (2*n)*eye(n);
end