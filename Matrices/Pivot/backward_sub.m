function x = backward_sub(U,b)
    [m,n] = size(U);
    d = size(b,1); 
%--------------------------------------------------    
    if n ~= m
        error('Not a square matrix')
    end
    if n ~= d
        error('Dimension mismatch on the vector and matrix')
    end
%--------------------------------------------------    
    x = zeros(size(b,1),1);
    
    %initialize
    x(n) = b(n)/U(n,n);
    
    %backward sub
    for k = n-1:-1:1
        x(k) = ( b(k) - (U(k,k+1:n)*x(k+1:n,1)) )/U(k,k);
    end

end