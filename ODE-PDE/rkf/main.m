%%%%%%%%%%%%%%%%%%%%%%%% Part 2 (plot(T,W,T,Y))
f = @(x,y) 1 + (y/x) + (y/x)^2;
tol = 10^(-6);
hmax = .5;
hmin = .05;
a = 1;
b = 3;
alpha = 0;

%Approximate Solution
[approx05,time05,steps05] = rkf(a,b,tol,alpha,hmax,hmin,f);
%Actual Solution
Y = time05.*tan(log(time05));

%Plots
plot(time05,Y,time05,approx05);
title('Value vs time');
legend('Actual','Approximation','location','southeast');
xlabel('time');
ylabel('y-value');
%%
%%%%%%%%%%%%%%%%%%%%%%%% Part 3 (plot(T,H))
figure
plot(time05,steps05)
title('Grid Size vs time');
xlabel('time');
ylabel('Grid Size');
legend('Step Size','location','southwest')

message = ['This is correct because the function gets steeper' ...
    'and steeper as t increases, therefore we would need h' ... 
    'to be more smaller to accomodate it'];
display(message)


%%
%%%%%%%%%%%%%%%%%%%%%%%% Part 4
%h's
hmin005 = .05;
hmax005 = .05;
hmin0025 = .025;
hmax0025 = .025;

%solutions
[approx005,time005,step005] = rkf(a,b,tol,alpha,hmax005,hmin005,f);
[approx0025,time0025,step0025] = rkf(a,b,tol,alpha,hmax0025,hmin0025,f);
%actual solution
Y005 = time005.*tan(log(time005));
Y0025 = time0025.*tan(log(time0025));

% Errors
abserror005 = max(abs(approx005 - Y005));
abserror0025 = max(abs(approx0025 - Y0025));

abserror005/abserror0025


% Error rkf is the order h^4
% case 1: hmax = hmin = .05
% check abserrror005 = max(abs(w005 - y005))

% case 2: hmax = hmin = .025
% .05^4/.025^4 = 16
%
% Abserror005/abserror0025 approximately should be 16






