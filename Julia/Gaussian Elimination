# Gaussian Elimination #
function gaussianElimination(A,b)
    n = size(A)[1]
    m = n
        
    if n != m
        error("This matrix isn't square")
    end
    
    if n != size(b)[1]
        error("Matrix size doesn't match with vector size")
    end
    
    M = hcat(A,b)
        
    for i = 1:n-1
        indnz = find(M[i:end,i])[1]
        indj = i + indnz
            
        if indj != i
            rowSwap!(M, i ,indj)
         end
            
        for j = i+1:n
            M[j,:] = M[j,:] - M[j,i]/M[i,i]*M[i,:]
        end
    end
        
        
     U = M[1:n,1:n]
    b1 = M[1:n, n+1]
    return (U,b1)
end
