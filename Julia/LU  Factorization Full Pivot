# LU  Factorization Full Pivot #
function luFactorizationFullPivoted(A)
    # checks
    m = size(A)[1]
    n = size(A)[2]
    
    #Possible Errors!
    (n != m) && error("This matrix is not a square matrix")
    (det(A) == 0) && error("This matrix is singular")
    
    
    L = zeros(A)
    U = zeros(A)
    P = speye(n) 
    Acopy = copy(A)

        
    for i = 1:n
        l = findmax(abs(A[i:end,i]))
        k = findmax(abs(A[i,i:end]))
        
        if l > k
            indexj = indmax(abs(Acopy[i:end,i]))
            rowSwap!(Acopy,i,(i-1)+indexj)
            rowSwap!(L,i,(i-1)+indexj)
            rowSwap!(P,i,(i-1)+indexj)
            
            U[i,i:end] = Acopy[i,i:end]
            L[i:end,i] = Acopy[i:end,i]/Acopy[i,i]
            Acopy[i:end,i:end] = Acopy[i:end,i:end] - L[i:end,i]*U[i,i:end] 
        end 
        
        if l < k
            indexz = indmax(abs(Acopy[i,i:end]))
            columnSwap!(Acopy,(i-1)+indexz,i)
            columnSwap!(L,(i-1)+indexz,i)
            columnSwap!(P,(i-1)+indexz,i)
            
            U[i,i:end] = Acopy[i,i:end]
            L[i:end,i] = Acopy[i:end,i]/Acopy[i,i]
            Acopy[i:end,i:end] = Acopy[i:end,i:end] - L[i:end,i]*U[i,i:end]
        end
            
    end
    
    
    return (L,U,P)
end    
