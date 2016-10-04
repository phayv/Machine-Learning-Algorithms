function x = GE_CP(A,b)
    [m,n] = size(A);
        d = size(b,1);
%----------------------------------------------------    
    if n ~= m
        error('This is not a square matrix')
    end
    if d ~= n
        error('Matrix to vector mismatch')
    end
%----------------------------------------------------
    M = [A b];
    
    for k = 1:n
        temp = 0; 
        ind_col = k;
        ind_row = k;
        % Checking the row and column to switch by complete pivot
        for i = k:n
            val_row = M(i,k)/(max(abs(M(i,k:end-1))));
            val_col = M(k,i)/(max(abs(M(k:end,i))));
            if val_row > val_col && val_row > temp
                ind_row = i;
                temp = val_row;
            end
            if val_row < val_col && val_col > temp
                ind_col = i;
                temp = val_col;
            end        
        end
%-------------------------------------------------------------------------
        if val_row > temp
            % row swap 
            if k ~= ind_row
                M = rowswap(M,k,ind_row);
            end
        end
        if val_col > temp
            % column swap
            if k ~= ind_col
                M = columnswap(M,k,ind_col);
            end
        end
%-------------------------------------------------------------------------
        %Gauss Eliminate
        for j = k+1:n
            M(j,:) = M(j,:) - M(j,k)/M(k,k)*M(k,:);
        end   
    end
    
    % No unique solutions
    if M(n,n)==0 || isnan(M(n,n))
        error('no unique solution');
    end
    
    x = backward_sub(M(1:n,1:n),M(1:n,n+1));
    
end