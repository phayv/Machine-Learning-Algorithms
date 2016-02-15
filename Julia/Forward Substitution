
function forwardSubstitution(L,b)
    # input:    L lower triangular matrix 
    #           b vector
    # output:   x = L\b
    (n,m) = size(L)
    
    x = zeros(n,1)
    
    for i = 1:n
        x[i]=b[i];
        for j = 1:(i-1)
            x[i] = x[i] - L[i,j]*x[j];
        end
        x[i] = x[i]/L[i,i]
    end
    
    
    return x
end
