%% Part 2
a = 0;
b = 1;
alpha = 1/3;
tol = 10^(-6);
M = 100;

actualy = @(x) x.^2 + (1/3)*exp(-20*x);

N5 = 5;
[w_5,t_5] = Trap_Newton(a,b,N5,alpha,tol,M);
plot(t_5,w_5);
hold on
plot(t_5,actualy(t_5));
title('N = 10')

N10 = 10;
[w_10,t_10] = Trap_Newton(a,b,N10,alpha,tol,M);
figure
plot(t_10,w_10);
hold on
plot(t_10,actualy(t_10));
title('N = 20')

N40 = 40;
[w_40,t_40] = Trap_Newton(a,b,N40,alpha,tol,M);
figure
plot(t_40,w_40);
hold on
plot(t_40,actualy(t_40));
title('N = 40')


%% Part 3
R5(1) = (1/3);
h5 = .2;

% N = 5
for i = 1:5
    k1 = h5*f(t_5(i),R5(i));
    k2 = h5*f(t_5(i)+(h5/2),R5(i)+(k1/2));
    k3 = h5*f(t_5(i)+(h5/2),R5(i)+(k2/2));
    k4 = h5*f(t_5(i)+h5,R5(i)+k3);
    
    R5(i+1) = R5(i) + ((k1 + 2*k2 + 2*k3 + k4)/6);
end

figure
plot(t_5,w_5,'o',t_5,R5,'-',t_5,actualy(t_5),'x')
title('N = 5 RK4, Trap. Newton, Actual')
legend('Trap Newton','RK4','Actual')


R10(1) = (1/3);
h10 = .1;
% N = 10
for i = 1:10
    k1 = h10*f(t_10(i),R10(i));
    k2 = h10*f(t_10(i)+(h10/2),R10(i)+(k1/2));
    k3 = h10*f(t_10(i)+(h10/2),R10(i)+(k2/2));
    k4 = h10*f(t_10(i)+h10,R10(i)+k3);
    R10(i+1) = R10(i) + ((k1 + 2*k2 + 2*k3 + k4)/6);
end


figure
plot(t_10,w_10,'o',t_10,R10,'-',t_10,actualy(t_10),'x')
title('N = 10 RK4, Trap. Newton, Actual')
legend('Trap Newton','RK4','Actual')

R40(1) = (1/3);
h40 = .025;
% N = 40
for i = 1:40
    k1 = h40*f(t_40(i),R40(i));
    k2 = h40*f(t_40(i)+(h40/2),R40(i)+(k1/2));
    k3 = h40*f(t_40(i)+(h40/2),R40(i)+(k2/2));
    k4 = h40*f(t_40(i)+h40,R40(i)+k3);
    R40(i+1) = R40(i) + ((k1 + 2*k2 + 2*k3 + k4)/6);
end

figure
plot(t_40,w_40,'o',t_40,R40,'-',t_40,actualy(t_40),'x')
title('N = 40 RK4, Trap. Newton, Actual')
legend('Trap Newton','RK4','Actual')



%% Part 4 
E5 = max(abs(actualy(t_5) - w_5));
E10 = max(abs(actualy(t_10) - w_10));
E40 = max(abs(actualy(t_40) - w_40));

(.1^2)/(.025^2)
ratio2 = E10/E40





