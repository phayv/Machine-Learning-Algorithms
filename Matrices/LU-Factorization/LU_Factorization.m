function [L,A] = LU_Factorization(A)
    [m,n] = size(A);
%--------------------------------------------------------------------------
    % singular matrix?
    if det(A) == 0
        error('singular matrix')
    end
    % square matrix?
    if m ~= n
        error('This is not a square matrix')
    end
%--------------------------------------------------------------------------
    L = eye(n,n);

    for i = 1:n
        for j = i+1:n
            L(j,i) = A(j,i)/A(i,i);
        end
        %Gauss Eliminate
        for k = i+1:n
            A(k,:) = A(k,:) - (A(k,i)/A(i,i))*A(i,:);
        end 
    end

end