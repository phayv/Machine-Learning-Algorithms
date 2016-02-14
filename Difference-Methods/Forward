%Forward Difference Method %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fpFD = forward_difference(X,Y,n,h)
syms x;
f(x) = (1+x^2)^(-1);
fpFD = zeros(1,n+1);

for i = 1:n
    fpFD(i) = (f(X(i)+h)-f(X(i)))/h;
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
