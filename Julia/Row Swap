# Row Swap #
function rowSwap!(A, i,j)
    
    n = size(A)[1]
    if i > n 
        error("This is larger than the matrix size!")
    end
    if j > n 
        error("This is larger than the matrix size!")
    end
    if i != j 
        buffer = A[i,:]
        A[i,:] = A[j,:]
        A[j,:] = buffer
    end
end
