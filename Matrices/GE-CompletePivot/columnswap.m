function A = columnswap(A,i,j)
%--------------------------------------------------
    if i > size(A,2)
        error('i is larger than the number of matrix columns!');
    end
    if j > size(A,2)
        error('j is larger than the number of matrix columns!');
    end
%--------------------------------------------------
    % Perform rowswap
    if i ~= j 
        buffer = A(:,i);
        A(:,i) = A(:,j);
        A(:,j) = buffer;
    end    
end