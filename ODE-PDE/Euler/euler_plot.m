function [t_values,y_values] = euler_plot(a,b,N,alpha)

h = (b-a)/N;
w = alpha;
t = a;

syms x;
syms y;
f(x,y) = ((2/x)*y) + (x^2*exp(x))

t_values = zeros(N,1);
t_values(1,1) = a;
y_values = zeros(N,1);
for i = 0:N
    w = w + h*f(t,w);
    t = a + i*h;
    t_values(i+1,1) = t;
    y_values(i+1,1) = w;
end


end
