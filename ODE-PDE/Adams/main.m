%% Part 2

[x,v] = RK4(.025,2,1);
a = 1;
b = 2;

actualy = @(x) x.*log(x) + 2*x;

alpha = 2;
tol = 10^(-4);
hmax = .25;
hmin = .025;

[t,w,H] = Adams_VPC(a,b,alpha,tol,hmax,hmin);

%% Part 3
actual = actualy(t);

plot(t,actual,'-',t,w,'o');
title('Actual vs Approxmiate solution')
legend('exact solution','approximate solution','location','southwest')

figure
plot(t,H,'-')
title('Step size vs t')


%% Part 4
hmin_05 = .05;
hmax_05 = .05;
[t_05,w_05,H_05] = Adams_VPC(a,b,alpha,tol,hmax_05,hmin_05);

hmin_025 = .025;
hmax_025 = .025;
[t_025,w_025,H_025] = Adams_VPC(a,b,alpha,tol,hmax_025,hmin_025);

