function [ws,ts] = Trap_Newton(a,b,N,alpha,tOL,M)
h = (b-a)/N;
t = a;
w = alpha;
ws = [w];
ts = [t];

for i = 1:N
    k1 = w + (h/2)*f(t,w);
    w0 = k1;
    j = 1;
    Flag = 0;
    while Flag == 0
        w = w0 - (w0 - (h/2)*f(t+h,w0) - k1)/(1 - (h/2)*fy(t+h,w0));
        if abs(w - w0) < tOL
            Flag = 1;
        else
            j = j + 1;
            w0 = w;
            if j > M
                %max exceeded
                break
            end
        end
    end
        t = a + (i*h);
        ts = [ts t];
        ws = [ws w];
end
        