%Part 1

%%%%
% See Part 1 PDF in files
%%%%


%Part 2
t = linspace(1,2,100);
y = (t.^2).*(exp(t)-exp(1));

a = 1;
b = 2;
alpha = 0;
N = 10;
[t_values, y_values] = euler_plot(a,b,N,alpha);

% ---------
figure
plot(t,y,t_values,y_values)
title('Graph of Actual Solution vs Comptued Solution')
xlabel('Time')
ylabel('Y-Values')
legend('Actual Solution','Computed Solution','Location','northwest')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 3
syms t;
f(t) = (t^2)*(exp(t)-exp(1));

a = 1;
alpha = 0;
N = 10;

% a) y(1.04)
b = 1.04;
X = linspace(1,1.1,100);
Y = (X.^2).*(exp(X)-exp(1));

interpolation104 = f_lagrange(X,Y,1.04);
actual104 = f(1.04);
abserrorinterpolation104 = vpa(abs(interpolation104-actual104),5);
euler104 = euler_method(a,b,N,alpha);
abserroreuler104 = vpa(abs(euler104 - actual104),5);

% b) y(1.55)
b = 1.55;
X = linspace(1.5,1.6,100);
Y = (X.^2).*(exp(X)-exp(1));

interpolation155 = f_lagrange(X,Y,1.55);
actual155 = vpa(f(1.55),5);
abserrorinterpolation155 = vpa(abs(interpolation155-actual155),5);
euler155 = euler_method(a,b,N,alpha);
abserroreuler155 = vpa(abs(euler155 - actual155),5);

% c) y(1.97)
b = 1.97;
X = linspace(1.9,2,100);
Y = (X.^2).*(exp(X)-exp(1));

interpolation197 = f_lagrange(X,Y,1.97);
actual197 = vpa(f(1.97),5);
abserrorinterpolation197 = vpa(abs(interpolation197-actual197),5);
euler197 = euler_method(a,b,N,alpha);
abserroreuler197 = vpa(abs(euler197 - actual197),5);

eulervalue = vpa([euler104,euler155,euler197],5)
interpolationvalue = [interpolation104,interpolation155,interpolation197]
actual = vpa([actual104,actual155,actual197],5)

interERROR = vpa([abserrorinterpolation104,abserrorinterpolation155,abserrorinterpolation197],5)
eulerERROR = vpa([abserroreuler104,abserroreuler155,abserroreuler197],5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part 4

% y''(t) = 2*(-e + e^t) + 4*(E^t)*t + (e^t)*(t^2) and max when t = 2
func(t) = 2*(-exp(1) + exp(t)) + 4*exp(t)*t + (exp(t))*(t^2);
M = vpa(func(2),5)

%Lipschitz Condition
% |((2/t)*y_1) + (t^2*exp(t)) - ((2/t)*y_1) + (t^2*exp(t))| < L|y_1 - y_2|
L = 2;

%Solving for h
%h < (0.2* L)/((-1*+E^(L (-a + t)))* M)
%this gives the following conditions

a = 1;
b = 2;
N = 1565;
alpha = 0;

part4function(a,b,N,alpha)













