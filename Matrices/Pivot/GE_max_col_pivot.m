function x = GE_max_col_pivot(A,b)
    [m,n] = size(A); % note n is m+1 because M is an augmented matrix
        l = size(b,1);
%--------------------------------------------------------------------------
    if n ~= m
        error('Not a square matrix')
    end
    
    if n ~= l
        error('Vector length doesn''t correspond to matrix')
    end

%--------------------------------------------------------------------------
    % Augmented Matrix
    M = [A b];
    
%     NROW = zeros(n,1);
%     for i = 1:n
%         NROW(i) = i;
%     end

    for i = 1:n-1
        % find the maximum of the column
        [temp,indj] = max(abs(M(i:n,i)));
        indj = indj + (i-1);
        
        if isempty(indj)
            error('Matrix is singular')
        end
        % if the maximum is not the pivot element, rowswap
        if indj ~= i
            M = rowswap(M,i,indj);
        end
        
        %Gauss Eliminate
        for j = i+1:n
            M(j,:) = M(j,:) - M(j,i)/M(i,i)*M(i,:);
        end    
    end
    
    if M(n,n) == 0 || isnan(M(n,n))
        error('no unique solution')
    end
    
    x = backward_sub(M(1:n,1:n),M(1:n,n+1));
   
end


