function [Id,x] = GE_backward_elim(A,b)
    [m,n] = size(A);
    d = size(b,1); 
%--------------------------------------------------    
    if n ~= m
        error('Not a square matrix')
    end
    if n ~= d
        error('Dimension mismatch on the vector and matrix')
    end
%--------------------------------------------------
    % Augmented Matrix
    M = [A,b];
    
    for i = 1:n-1
        % find the first nonzero element
        indz = find(M(i:end,i),1)-1;
        indj = indz+i;

        % if the first nonzero element is not the diagonal element
        % rowswap with the next positive
        if indj ~= i
            M = rowswap(M,i,indj);
        end
        
        % Gaussian Eliminate
        for j = i+1:n
            M(j,:) = M(j,:) - M(j,i)/M(i,i)*M(i,:);
        end
        
        % No unique solutions
        if M(n,n)==0 || isnan(M(n,n))
            error('no unique solution');
        end
    end

    [Id,x] = backward_elim(M);
    
end