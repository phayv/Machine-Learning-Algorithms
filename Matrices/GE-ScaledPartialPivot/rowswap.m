function A = rowswap(A,i,j)
%--------------------------------------------------
    if i > size(A,1)
        error('i is larger than the matrix size!');
    end
    if j > size(A,1)
        error('j is larger than the matrix size!');
    end
%--------------------------------------------------
    % Perform rowswap
    if i ~= j 
        buffer = A(i,:);
        A(i,:) = A(j,:);
        A(j,:) = buffer;
    end    
end
