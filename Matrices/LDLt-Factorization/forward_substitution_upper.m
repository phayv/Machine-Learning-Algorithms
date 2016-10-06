% Also known as backward_sub
function x = forward_substitution_upper(U,y)
    [m,n] = size(U); 
%--------------------------------------------------    
    if n ~= m
        error('Not a square matrix')
    end
    if n ~= size(y,1)
        error('Dimension mismatch on the vector and matrix')
    end
%--------------------------------------------------    
    x = zeros(size(y,1),1);
    
    x(n) = y(n)/U(n,n);
    for k = n-1:-1:1
        x(k) = (y(k) - (U(k,k+1:n)*x(k+1:n,1)) )/U(k,k);
    end

end