function [L,D,Lt] = LDLt_Factorization(A)
    [m,n] = size(A);
%--------------------------------------------------------------------------
    if m ~= n
        error('Not a square matrix')
    end
%--------------------------------------------------------------------------
    L = eye(n,n);
    D = eye(n,n);
    v = zeros(n,1);
    
    D(1,1) = A(1,1);
    for i = 1:n
        for j = 1:i-1
            v(j,1) = L(i,j)*D(i,i);        
        end
        D(i,i) = A(i,i) - L(i,j:i-1)*v(j:i-1,1);
        for j = i+1:n
            L(j,i) = (A(j,i) - L(j,1:i-1)*v(1:i-1,1))/D(i,i);
        end
    end
    
    Lt = L';
    
end