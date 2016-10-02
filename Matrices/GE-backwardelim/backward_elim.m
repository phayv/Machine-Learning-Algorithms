function [Id,x] = backward_elim(M)
    [m,n] = size(M);
    d = size(M(:,:),1); 
%--------------------------------------------------    
    if n-1 ~= m
        error('Not a square matrix')
    end
    if n-1 ~= d
        error('Dimension mismatch on the vector and matrix')
    end
%--------------------------------------------------
    for i = n-1:-1:1
        % normalize the diagonal to 1's
        M(i,:) = M(i,:)/M(i,i);
        for j = i-1:-1:1
            % eliminating the rest of the row
            M(j,:) = M(j,:) - M(j,i)*M(i,:);
        end
    end
        
    Id = M(1:n-1,1:n-1);
    x  = M(1:n-1,n);
   
end