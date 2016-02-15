function gaussianEliminationPartialPivoting(A,b)
    #input:   A squared matrix
    #         b a vector
    #output:  U upper triangular matrix
    #         b1 the resulting vector 
    
    # safety checks
    (n,m) = size(A)
    (n != m) && error("Matrix is not square \n")
    (n != size(b)[1]) && error("Dimension mismatch \n")
    
    # create the augmented matrix 
    M = hcat(A,b)

    for i = 1:(n-1)
        indexj =  find(abs(M[i:end,i]).> eps(1.0))
        isempty(indexj) && error("The matrix is singular \n")
        
        maxValue = maximum(M[i:end,i])
        pivotrow = i
        for k = i:n
            if M[k] == maxValue
                pivotrow = k
            end
        end
        rowSwap!(M,i,pivotrow)
        
        for j = i+1:n
            M[j,:] = M[j,:] - (M[j,i]/M[i,i])*M[i,:]
        end
    end
    
    # slicing the matrices
    U = M[:,1:n]
    b1 = M[:,n+1:end]
    return (U,b1)

    
end
