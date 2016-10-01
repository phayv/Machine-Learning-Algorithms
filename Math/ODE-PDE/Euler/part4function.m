function part4function(a,b,N,alpha)
h = (b-a)/N;
w = alpha;
t = a;

syms x;
syms y;
syms z;
g(x,y) = ((2/x)*y) + (x^2*exp(x));
f(z) = z^2*(exp(z)-exp(1));


for i = 0:N
    w = w + h*g(t,w);
    if abs(f(t) - w) < .1
        error('Your h is not a right choice!')
    else
        t = a + i*h;
    end
end

display('Looks like h was the right choice')

end