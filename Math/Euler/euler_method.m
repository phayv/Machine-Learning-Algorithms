function answer = euler_method(a,b,N,alpha)
h = (b-a)/N;
w = alpha;
t = a;

syms x;
syms y;
f(x,y) = ((2/x)*y) + (x^2*exp(x));

for i = 0:N
    w = w + h*f(t,w);
    t = a + i*h;
end

answer = w;
end


