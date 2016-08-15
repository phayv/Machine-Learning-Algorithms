function [v,x] = RK4(h,alpha,x0)
v = zeros(4,1);
v(1) = alpha;
x = zeros(4,1);
x(1) = x0;

f = @(x,y) 1 + y/x;

for i = 1:3
    %Runge Equations
    k1 = h*f(x(i),v(i));
    k2 = h*f(x(i) + h/2, v(i) + k1/2);
    k3 = h*f(x(i) + h/2, v(i) + k2/2);
    k4 = h*f(x(i) + h, v(i) + k3);
    
    %next values
    v(i+1) = v(i) + ((k1+(2*k2)+(2*k3)+k4)/6);
    x(i+1) = x0 + i*h;
end

end