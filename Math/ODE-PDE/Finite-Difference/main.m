%% Part 2

a = 1;
b = 2;
alpha = 0;
beta = log(2);
TOL = 10^(-6);
M = 100;

f = @(x,y,yp) -(yp^2) - y + log(x); 
fy = @(x,y,yp) -1;
fyp = @(x,y,yp) -2*yp;

actualf = @(x) log(x);


%%
N10 = 10;
[x_10,w_10,k_10] = Finite_Difference(a,b,alpha,beta,N10,TOL,M,f,fy,fyp);
actual10 = actualf(x_10);

plot(x_10,w_10,'x',x_10,actual10,'-');
title('y(x) vs x')
legend('x10 vs w10','actual vs x')



N20 = 20;
[x_20,w_20,k_20] = Finite_Difference(a,b,alpha,beta,N20,TOL,M,f,fy,fyp);
actual20 = actualf(x_20);

figure
plot(x_20,w_20,'o',x_20,actual20,'-');
title('y(x) vs x')
legend('x20 vs w20','actual vs x')



N40 = 40;
[x_40,w_40,k_40] = Finite_Difference(a,b,alpha,beta,N40,TOL,M,f,fy,fyp);
actual40 = actualf(x_40);

figure
plot(x_40,w_40,'o',x_40,actual40,'-');
title('y(x) vs x')
legend('x40 vs w40','actual vs x')


%% Part 4

ks = [k_10,k_20,k_40];

display('The minimum number of iterations required is')
max(ks)

abserrors10 = abs(actual10 - w_10);
display('The overall accuracy of the Newton 10 is')
max(abserrors10)

abserrors20 = abs(actual20 - w_20);
display('The overall accuracy of the Newton 20 is')
max(abserrors20)

abserrors40 = abs(actual40 - w_40);
display('The overall accuracy of the Newton 40 is')
max(abserrors40)


