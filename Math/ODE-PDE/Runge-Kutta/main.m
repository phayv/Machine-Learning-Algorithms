%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% h = .1
N = 10;

syms x;
syms y;
f(x,y) = (2-(2*x*y))/(x^2+1);
a = 0;
b = 1;
alpha = 1;

[approx10, time10] = rk4(a,b,N,alpha,f);

time100 = linspace(0,1,100);
g(x) = (2*x+1)/(x^2+1);

plot(time100,g(time100),'-r',time10,approx10,'-b')
legend('actual','approx','Location','northwest')
title('Actual vs Approx')
xlabel('t')
ylabel('y-value')
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% h = .1 done already
error01 = zeros(N,1);
for i = 1:N
   error01(i) = abs(g(time10(i)) - approx10(i));
end
maxerror01 = max(error01)
order01 = .1^4

% h = .05
N = 20;
[approx20, time20] = rk4(a,b,N,alpha,f);
error005 = zeros(N,1);
for i = 1:N
   error005(i) = abs(g(time20(i)) - approx20(i));
end
maxerror005 = max(error005)
order005 = .05^4


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Approx y(.355) using h = .1
exact355 = vpa(g(.355),5)

%k3 = find(time10 == .3)
k3 = 4;
k4 = find(time10 == .4);
k5 = find(time10 == .5);

% RK4 errors at .3 and .4
actual3 = vpa(g(.3),5);
actual4 = vpa(g(.4),5);
abserror3 = error01(k3)
abserror4 = error01(k4)


%%%%%%%% Lagrange %%%%%%%%
X = [.3,.4];
Y = [approx10(k3),approx10(k4)];

RKlagrange = f_lagrange(X,Y,.355)
abserrorlagrange = vpa(abs(actual355-RKlagrange),5)


%%%%%%%% Hermite %%%%%%%%
%forward difference
wp3 = (approx10(k4) - approx10(k3))/(time10(k4)-time10(k3));
wp4 = (approx10(k5) - approx10(k4))/(time10(k5)-time10(k4));

YP = [wp3,wp4];

[RKHermite,] = hermite(X,Y,YP,.355)
abserrorhermite = vpa(abs(actual355-RKHermite),5)










