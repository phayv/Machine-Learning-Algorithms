% Backward Difference
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fpBD = backward_difference(X,Y,n,h)
syms x;
f(x) = (1+x^2)^(-1);
fpBD = zeros(1,n+1);

for i = n+1:-1:2
    fpBD(i) = (f(X(i))-f(X(i)-h))/h;
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
