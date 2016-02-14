% Simpson's Rule %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Integral = Simpsons_Rule(x0,x2,n)
h = (x2 - x0)/n;

syms x;
f(x) = x*log(x);

I = zeros(n,3);
I(n,1) = f(x0) + f(x2);
I(n,2) = 0;
I(n,3) = 0;

%for loop for the sums 
for i = 1:n-1
    x = x0 + i*h;
    
    if mod(i,2) == 0 % if the number is even.
        I(n,2) = I(n,2) + f(x);
    else  % if a number is not even then it is odd.
        I(n,3) = I(n,3) + f(x);
    end
    
end

Integral = (h/3)*(I(n,1)+2*I(n,2)+4*I(n,3));

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
