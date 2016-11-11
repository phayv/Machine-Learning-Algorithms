function [x,w,k] = Finite_Difference(a,b,alpha,beta,N,TOL,M,f,fy,fyp)
if N == 1
    error('N needs to be greater than or equal to 2')
end

k = 1;
h = (b-a)/(N+1);

%initialization
w = zeros(N+2,1);
as = zeros(N,1);
bs = zeros(N,1);
cs = zeros(N,1);
ds = zeros(N,1);
l = zeros(N,1);
u = zeros(N,1);
z = zeros(N,1);
v = zeros(N,1);
x = zeros(N+2,1);



%initial values
w(1) = alpha;
w(N+2) = beta;
x(1) = 1;
x(N+2) = 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CHECKED


%initial guess
for i = 2:N+1
    w(i) = alpha + (i-1)*((beta-alpha)/(b-a))*h;
end


while k <= M
    %initial 
    x(2) = a + h;
    t = (w(3) - alpha)/(2*h);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CHECKED
    %first line of the matrix
    as(1) = 2 + (h^2)*fy(x(2),w(2),t);
    bs(1) = -1 + (h/2)*fyp(x,w(2),t);

    ds(1) = -(2*w(2) - w(3) - alpha + (h^2)*f(x(2),w(2),t));    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CHECKED
    for i = 2:N-1
        x(i+1) = a + i*h;
        t = (w(i+2) - w(i))/(2*h);
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CHECKED
        %tridiagonal elements
        as(i) = 2 + (h^2)*fy(x(i+1),w(i+1),t);
        bs(i) = -1 + (h/2)*fyp(x(i+1),w(i+1),t);
        cs(i) = -1 - (h/2)*fyp(x(i+1),w(i+1),t);
        
        ds(i) = -(2*w(i+1) - w(i+2) - w(i) + (h^2)*f(x(i+1),w(i+1),t));
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CHECKED
    x(N+1) = b - h;
    t = (beta - w(N))/(2*h);
    
    %last line elements of matrix 
    as(N) = 2 + (h^2)*fy(x(N+1),w(N+1),t);
    cs(N) = -1 - (h/2)*fyp(x(N+1),w(N+1),t);
    
    ds(N) = -(2*w(N+1) - w(N) - beta + (h^2)*f(x(N+1),w(N+1),t));
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CHECKED
    %Solving the System
    l(1) = as(1);
    u(1) = bs(1)/as(1);
    z(1) = ds(1)/l(1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CHECKED
    for i = 2:N-1
        l(i) = as(i) - cs(i)*u(i-1);
        u(i) = bs(i)/l(i);
        z(i) = (ds(i) - cs(i)*z(i-1))/l(i);
    end
    
    l(N) = as(N) - cs(N)*u(N-1);
    z(N) = (ds(N) - cs(N)*z(N-1))/l(N);
   
    v(N) = z(N);
    w(N+1) = w(N+1) + v(N);
    

    for i = N-1:-1:1
        v(i) = z(i) - u(i)*v(i+1);
        w(i+1) = w(i+1) + v(i);
    end
    if norm(v) <= TOL
        return
    end
    
    k = k+1;
   
%end of while 
end


end