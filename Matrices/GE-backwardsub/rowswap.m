% There is a linalg package that swaps rows
function A = rowswap(A,i,j)
%--------------------------------------------------
    if i > size(A,1)
        error('i is larger than the number of matrix rows!');
    end
    if j > size(A,1)
        error('j is larger than the number of matrix rows!');
    end
%--------------------------------------------------
    % Perform rowswap
    if i ~= j 
        buffer = A(i,:);
        A(i,:) = A(j,:);
        A(j,:) = buffer;
    end    
end
