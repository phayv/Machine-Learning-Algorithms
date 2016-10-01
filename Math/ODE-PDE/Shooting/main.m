%%             Part 1




%%
f = @(x,y,yp) y^3 - y*yp;
fy = @(x,y,yp) 3*(y^2) - yp;
fyp = @(x,y,yp) -y;

actualf = @(x) 1/(x+1);
a = 1;
b = 2;
alpha = 1/2;
beta = 1/3;
TOL = 10^(-6);
M = 100;

%%             Part 2
%Non-Linear Shooting Newton Method

% h = .1
N10 = 10;
[x_10,w_10,kN_10,TKN_10] = Nonlinear_Shooting_Newton(a,b,alpha,beta,N10,TOL,M,f,fy,fyp);
wn1_10 = w_10(:,1);
wn2_10 = w_10(:,2);
actualf_10 = 1./(x_10 + 1);
actualfp_10 = -1./((1 + x_10).^2);

plot(x_10,wn1_10,x_10,wn2_10,x_10,actualf_10,x_10,actualfp_10)
title('Newton Method N = 10')
legend('y(x) vs x','yp(x) vs x','actual y(x) vs x','actual yp(x) vs x')

% h = .05
N20 = 20;
[x_20,w_20,kN_20,TKN_20] = Nonlinear_Shooting_Newton(a,b,alpha,beta,N20,TOL,M,f,fy,fyp);
wn1_20 = w_20(:,1);
wn2_20 = w_20(:,2);
actualf_20 = 1./(x_20+1);
actualfp_20 = -1./((1 + x_20).^2);

figure
plot(x_20,wn1_20,x_20,wn2_20,x_20,actualf_20,x_20,actualfp_20)
title('Newton Method N = 20')
legend('y(x) vs x','yp(x) vs x','actual y(x) vs x','actual yp(x) vs x')

% h = .025
N40 = 40;
[x_40,w_40,kN_40,TKN_40] = Nonlinear_Shooting_Newton(a,b,alpha,beta,N40,TOL,M,f,fy,fyp);
wn1_40 = w_40(:,1);
wn2_40 = w_40(:,2);
actualf_40 = 1./(x_40+1);
actualfp_40 = -1./((1 + x_40).^2);

figure
plot(x_40,wn1_40,x_40,wn2_40,x_40,actualf_40,x_40,actualfp_40)
title('Newton Method N = 40')
legend('y(x) vs x','yp(x) vs x','actual y(x) vs x','actual yp(x) vs x')

%%             Part 3 
%Non-Linear Shooting Secant Method

% h = .1
N10 = 10;
[x_10,w_10,kS_10,TKS_10] = Nonlinear_Shooting_Secant(a,b,alpha,beta,N10,TOL,M,f);
ws1_10 = w_10(:,1);
ws2_10 = w_10(:,2);

plot(x_10,ws1_10,x_10,ws2_10,x_10,actualf_10,x_10,actualfp_10)
title('Secant Method N = 10')
legend('y(x) vs x','yp(x) vs x','actual y(x) vs x','actual yp(x) vs x')

% h = .05
N20 = 20;
[x_20,w_20,kS_20,TKS_20] = Nonlinear_Shooting_Secant(a,b,alpha,beta,N20,TOL,M,f);
ws1_20 = w_20(:,1);
ws2_20 = w_20(:,2);

figure
plot(x_20,ws1_20,x_20,ws2_20,x_20,actualf_20,x_20,actualfp_20)
title('Secant Method N = 20')
legend('y(x) vs x','yp(x) vs x','actual y(x) vs x','actual yp(x) vs x')

% h = .025
N40 = 40;
[x_40,w_40,kS_40,TKS_40] = Nonlinear_Shooting_Secant(a,b,alpha,beta,N40,TOL,M,f);
ws1_40 = w_40(:,1);
ws2_40 = w_40(:,2);

figure
plot(x_40,ws1_40,x_40,ws2_40,x_40,actualf_40,x_40,actualfp_40)
title('Secant Method N = 40')
legend('y(x) vs x','yp(x) vs x','actual y(x) vs x','actual yp(x) vs x')


%%             Part 4

%As we can see secant requires more than newton
k_newton = [kN_10,kN_20,kN_40]
k_secant = [kS_10,kS_20,kS_40]
display('We see that newton method requires less iterations.')

abserror_newton = [abs(wn1_10(end) - beta),abs(wn1_10(end) - beta),abs(wn1_10(end) - beta) ]
abserror_secant = [abs(ws1_10(end) - beta), abs(ws1_20(end) - beta), abs(ws1_40(end) - beta)]
display('We see that the newton method is more accurate as well.')

TK_values = [TKN_10,TKN_20,TKN_40,TKS_10,TKS_20,TKS_40]

