function y = forward_substitution_lower(L,b)
    [m,n] = size(L);
%--------------------------------------------------------------------------
    if m ~= n 
        error('Not a square matrix')
    end
    if n ~= size(b,1)
        error('Matrix and vector mismatch')
    end
%--------------------------------------------------------------------------
    y = zeros(n,1);
    
    y(1,1) = b(1,1)/L(1,1);
    for i = 2:n
        y(i,1) = (b(i,1) - L(i,1:i-1)*y(1:i-1,1))/L(i,i);
    end
end