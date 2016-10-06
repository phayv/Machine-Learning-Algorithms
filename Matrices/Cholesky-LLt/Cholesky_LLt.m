function [L,Lt] = Cholesky_LLt(A)
    [m,n] = size(A);
%--------------------------------------------------------------------------
    if m ~= n
        error('Not a square matrix')
    end
%--------------------------------------------------------------------------
    L = eye(n,n);
    
    L(1,1) = sqrt(A(1,1));
    for k = 2:n
        L(k,1) = A(k,1)/L(1,1);
    end
    
    for i = 2:n-1
        L(i,i) = sqrt(A(i,i) - sum(L(i,1:i-1).^2));
        for j = i+1:n
            L(j,i) = (A(j,i) - sum(L(j,1:i-1)*(L(i,1:i-1)')))/L(i,i);
        end
    end
    L(n,n) = sqrt(A(n,n) - sum(L(n,1:n-1).^2));
    
    Lt = L';
end