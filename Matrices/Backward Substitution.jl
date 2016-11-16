# Backward Substitution #
function backwardSubstitution(U,b1)
    n = size(U)[1]
    m = n
    
    
    if n != m
        error("This matrix isn't square")
    end
    if n != size(b1)[1]
        error("Matrix size doesn't match with vector size")
    end
    
    
    x = zeros(b1)
    n = length(b1)
    
    for j = n:-1:1
        x[j] = (b1[j] - (U[j,j+1:n]*x[j+1:n])[1])/U[j,j]
    end
    
    return x
    
    
    
end
