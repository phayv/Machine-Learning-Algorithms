function [Approx,time,steps] = rkf(a,b,tol,alpha,hmax,hmin,f)

t = a;
w = alpha;
h = hmax;
time = [a];
Approx = [alpha];
steps =[hmax];

FLAG = 1;

while FLAG == 1
    k1 = h*f(t,w);
    k2 = h*f(t+h/4,w+k1/4);
    k3 = h*f(t+((3*h)/8),w+((3*k1)/32)+((9*k2)/32));
    k4 = h*f(t+((12*h)/13),w+((1932*k1)/2197)-((7200*k2)/2197)+((7296*k3/2197)));
    k5 = h*f(t+h,w+((439*k1)/216)-(8*k2)+((3680*k3/513))-((845*k4)/4104));
    k6 = h*f(t+(h/2),w-((8*k1)/27)+(2*k2)-((3544*k3)/2565)+((1859*k4)/4104)-((11*k5)/40));
    
    %R
    R = (1/h)*abs((k1/360)-((128*k3)/4275)-((2197*k4)/75240)+(k5/50)+((2*k6)/55));
    % note that R = (1/h)*|w'_i+1 - w_i+1|
    if R <= tol
        t = t + h;
        w = w + ((25*k1)/216)+((1408*k3)/2565)+((2197*k4)/4104)-(k5/5);
        
        time = [time t];
        Approx = [Approx w];
        steps = [steps h];
    end
    
    %Delta
    delta = .84*((tol/R)^(1/4));
    if delta <= .1
        h = .1*h;
    elseif delta >= 4
        h = 4*h;
    else
        h = delta*h;
    end
        
    %Don't let h be too big
    if h > hmax
        h = hmax;
    end
    
    %Don't let t be bigger than b
    if t >= b
        FLAG = 0;
    elseif t+h > b
        h = b-t;
    elseif h < hmin
        FLAG = 0;
        error('minimum h exceeded'),
    end
end

end