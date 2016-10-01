% Central Difference %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fpCD = central_difference(X,Y,n,h)
syms x;
f(x) = (1+x^2)^(-1);
fpCD = zeros(1,n+1);

for i = 2:n
    fpCD(i) = (f(X(i)+((1/2)*h))-f(X(i)-((1/2)*h)))/h;
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
