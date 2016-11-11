function [x,w,k,TK] = Nonlinear_Shooting_Secant(a,b,alpha,beta,N,TOL,M,f)
h = (b-a)/N;
k = 1;

% INITIALIZE
w = zeros(N+1,2);
x = zeros(N+1,1);

%initial t and w
x(1,1) = a;
t0 = (beta - alpha)/(b-a);
w0 = 0;

while k <= M
    
    w(1,1) = alpha;
    
    if k==1
        w(1,2) = t0;
    else
        w(1,2)=TK;
    end
%     u1 = 0;
%     u2 = 1;

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
        
       
    end
    
    %if reaches tolerance stop
    if abs(w(N+1,1) - beta) <= TOL
        break
    end
    
    %haven't reached tolerance keep going
    if k == 1
        k = k + 1;
        TK = t0 + (beta - w(N+1,1))/(b-a);
        w0 = w(N+1,1);
    else
        t_temp = TK;
        w(N+1,1);
        %replace step 10 (needs data from the past two loop iterations
        TK = TK - ((w(N+1,1) - beta)*(TK - t0))/(w(N+1,1) - w0);
        
        %ready for the next step iteration
        k = k + 1;
        t0 = t_temp;
        w0 = w(N+1,1);
    end
    
end
    
end