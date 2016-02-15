# LU Factorization Pivot #
function luFactorizationPivoted(A)
    # write your function
    (n,m) = size(A);
    (n != m) && error("This is not a square matrix")
    (det(A) == 0) && error("This matrix is singular")
    
    L = zeros(A)
    U = zeros(A)
    P = speye(n)
    
    Acopy = copy(A)
    
    for i = 1:m
        indexj = indmax(abs(Acopy[i:end,i]))
        rowSwap!(Acopy,i,(i-1)+indexj)
        rowSwap!(L,i,(i-1)+indexj)
        rowSwap!(P,i,(i-1)+indexj)
        
        U[i,i:end] = Acopy[i,i:end]
        L[i:end,i] = Acopy[i:end,i]/Acopy[i,i]
        Acopy[i:end,i:end] = Acopy[i:end,i:end] - L[i:end,i]*U[i,i:end]
    end
    
    return (L,U,P)
end    
