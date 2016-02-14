% Trapezoid Rule %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Integral = Trapzoid_Rule(x1,x2,n)
h = (x2 - x1)/n;

syms x;
f(x) = x*log(x);

fsum = 0;
for i = 1:n-1
    x = x1 + i*h;
    fsum = vpa(fsum + f(x));
end

Integral = (h/2)*(f(x1) + 2*vpa(fsum) + f(x2));

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
