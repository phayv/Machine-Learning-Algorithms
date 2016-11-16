# Upward Gaussian Elim #
function upwardGaussianElimination(U,B)
    
    (n,m) = size(U)
    (n != m) && error("Matrix is not square \n")
    (n != size(B)[1]) && error("Dimension mismatch \n")
    
    M = hcat(U,B)
    
    for i = n:-1:1
        M[i,:] = M[i,:]/M[i,i]
        
        for j=i-1:-1:1
            M[j,:] = M[j,:] - M[j,i]*M[i,:]
        end
    end

    I = M[1:n,1:n]
    X = M[1:n,n+1:end]
    return (I,X)
end
