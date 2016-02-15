# LU Factorization #
function luFactorization(A)
    # input A: a nxn matrix

    #This is to check if a matrix is singular
    k = det(A)
    
    if abs(k) < eps(1.0)
        error("This is a singular matrix and cannot be factorized")
    end
    
    #This is to check if the matrix is square
    p = size(A)[1]
    o = size(A)[2]
    if o != p
        error("This is not a square matrix!")
    end
    
    Acopy = copy(A)
    L = zeros(p,p)
    U = zeros(p,p)
    
    #Can this matrix be Factorized?
    
    for i = 1:n
        U[i,i:end] = Acopy[i,i:end];
        L[i,i:end] = Acopy[i:end,i]/Acopy[i,i];
        Acopy[i:end,i:end] = Acopy[i:end,i:end] - L[i:end,i]*U[i,i:end]
    end
        
    
    # output L: lower triangular matrix
    
    #        U: upper triangular matrix
    return (L,U)
end    
