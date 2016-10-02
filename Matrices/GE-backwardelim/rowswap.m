% There is a linalg package that swaps rows
function A = rowswap(A,i,j)
    n = size(A);
%--------------------------------------------------
    if i > n(1)
        error('i is larger than the matrix size!');
    end
    if j > n(1)
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