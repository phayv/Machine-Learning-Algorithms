function [approx, time] = rk4(a,b,N,alpha,f)
%initials
h = (b-a)/N;
t = zeros(N,1);
w = zeros(N,1);

t(1) = a;
w(1) = alpha;

for i = 1:N
    %Runge Equations
    k1 = h*f(t(i),w(i));
    k2 = h*f(t(i) + h/2, w(i) + k1/2);
    k3 = h*f(t(i) + h/2, w(i) + k2/2);
    k4 = h*f(t(i) + h, w(i) + k3);
    
    
    w(i+1) = w(i) + ((k1+(2*k2)+(2*k3)+k4)/6);
    t(i+1) = a + i*h;
end

approx = w;
time = t;

end