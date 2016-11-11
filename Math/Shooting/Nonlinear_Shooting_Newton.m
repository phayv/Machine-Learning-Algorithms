function [x,w,k,TK] = Nonlinear_Shooting_Newton(a,b,alpha,beta,N,TOL,M,f,fy,fyp)
h = (b-a)/N;
k = 1;
TK = (beta-alpha)/(b-a);

% INITIALIZE
w = zeros(N+1,2);
x = zeros(N+1,1);
x(1,1) = a;

while k <= M
    w(1,1) = alpha;
    w(1,2) = TK;
    u1 = 0;
    u2 = 1;
    
    %Runge Kutta (Lots of Equations)
    for i = 1:N
        x(i+1,1) = a + i*h;
        
        %regular
        k11 = h*w(i,2);
        k12 = h*f(x(i,1), w(i,1), w(i,2));
        k21 = h*(w(i,2) + (1/2)*k12);
        k22 = h*f(x(i,1) + (h/2), w(i,1) + (1/2)*k11, w(i,2) + (1/2)*k12);
        k31 = h*(w(i,2) + (1/2)*k22);
        k32 = h*f(x(i,1) + (h/2),w(i,1) + (1/2)*k21, w(i,2) + (1/2)*k22);
        k41 = h*(w(i,2) + k32);
        k42 = h*f(x(i,1) + h, w(i,1) + k31, w(i,2) + k32);
        
        w(i+1,1) = w(i,1) + (1/6)*(k11 + 2*k21 + 2*k31 + k41);
        w(i+1,2) = w(i,2) + (1/6)*(k12 + 2*k22 + 2*k32 + k42);
        
        %prime
        kp11 = h*u2;
        kp12 = h*(fy(x(i,1), w(i,1), w(i,2))*u1 + fyp(x(i,1),w(i,1),w(i,2))*u2);
        kp21 = h*(u2 + (1/2)*kp12);
        kp22 = h*(fy(x(i,1) + (h/2), w(i,1), w(i,2))*(u1 + (1/2)*kp11) ... 
            + fyp(x(i,1) + (h/2), w(i,1), w(i,2))*(u2 + (1/2)*kp12));
        kp31 = h*(u2 + (1/2)*kp22);
        kp32 = h*(fy(x(i,1) + (h/2), w(i,1), w(i,2))*(u1 + (1/2)*kp21) ... 
            + fyp(x(i,1) + (h/2), w(i,1), w(i,2))*(u2 + (1/2)*kp22));
        kp41 = h*(u2 + kp32);
        kp42 = h*(fy(x(i,1) + h, w(i,1), w(i,2))*(u1 + (1/2)*kp31) ... 
            + fyp(x(i,1) + h, w(i,1), w(i,2))*(u2 + (1/2)*kp32));
        
        u1 = u1 + (1/6)*(kp11 + 2*kp21 + 2*kp31 + kp41);
        u2 = u2 + (1/6)*(kp12 + 2*kp22 + 2*kp32 + kp42);    
    end
    
    if abs(w(N+1,1) - beta) <= TOL
       break;
    end
    
    TK = TK - (w(N+1,1) - beta)/u1;
    k = k + 1;
        
    
end


end