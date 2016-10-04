function x = GE_SPP(A,b)
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
        ind = k;
        % Checking the row to switch by scaled partial
        for i = k:n
            val = M(i,k)/(max(abs(M(i,k:end-1))));
            if val > temp
                ind = i;
                temp = val;
            end
        end
        
        % swap according to scaled partial criterion
        if k ~= ind
            M = rowswap(M,k,ind);
        end     
    
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
