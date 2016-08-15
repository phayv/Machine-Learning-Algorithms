Max_IT = 2000;

a = 0;
b = 1;
c = 0;
d = 1;
TOL = 10^(-6);
f = @(x,y) (x^2 + y^2)*exp(x*y);
g = @(x,y) exp(x*y);


%% Part 2
N10 = 10;
M10 = 10;
[w_10,x_10,y_10] = Poisson_FD(a,b,c,d,M10,N10,TOL,Max_IT,f,g);

N20 = 20;
M20 = 20;
[w_20,x_20,y_20] = Poisson_FD(a,b,c,d,M20,N20,TOL,Max_IT,f,g);

N40 = 40;
M40 = 40;
[w_40,x_40,y_40] = Poisson_FD(a,b,c,d,M40,N40,TOL,Max_IT,f,g);


%% Part 3

mesh(x_10,y_10,w_10)
title('Approximation N = 10')

figure
mesh(x_20,y_20,w_20)
title('Approximation N = 20')

figure
mesh(x_40,y_40,w_40)
title('Approximation N = 40')

%EVERYTHING UP TO HERE IS FINE


u = @(x,y) exp(x*y);

actual_10 = zeros(N10-1,M10-1);
error_10 = zeros(N10-1,M10-1);

for i = 1:N10-1
    for j = 1:M10-1
        actual_10(i,j) = u(x_10(i),y_10(j));
        error_10(i,j) = actual_10(i,j) - w_10(i,j);
    end
end
% figure
% mesh(x_10,y_10,error_10)
% title('N = 10 Error')

actual_20 = zeros(N20-1,M20-1);
error_20 = zeros(N20-1,M20-1);
for i = 1:N20-1
    for j = 1:M20-1
        actual_20(i,j) = u(x_20(i),y_20(j));
        error_20(i,j) = actual_20(i,j) - w_20(i,j);
    end
end
% figure
% mesh(x_20,y_20,error_20)
% title('N = 20 Error')

actual_40 = zeros(N40-1,M40-1);
error_40 = zeros(N40-1,M40-1);
for i = 1:N40-1
    for j = 1:M40-1
        actual_40(i,j) = u(x_40(i),y_40(j));
        error_40(i,j) = actual_40(i,j) - w_40(i,j);
    end
end
% figure
% mesh(x_40,y_40,error_40)
% title('N = 40 Error')


%% Part 4
for i = 1:N10-1
    for j = 1:M10-1
        abserror_10(i,j) = abs(actual_10(i,j) - w_10(i,j));
    end
end

for i = 1:N20-1
    for j = 1:M20-1
        abserror_20(i,j) = abs(actual_20(i,j) - w_20(i,j));
    end
end

for i = 1:N40-1
    for j = 1:M40-1
        abserror_40(i,j) = abs(actual_40(i,j) - w_40(i,j));
        
    end
end



%finds the max value of the entire matrix
compare10 = 0;
for i = 1:N10-1
    for j = 1:M10-1
        errorval10 = abserror_10(i,j);
        if errorval10 > compare10
        compare10 = errorval10;
        end
    end
end

compare20 = 0;
for i = 1:N20-1
    for j = 1:M20-1
        errorval20 = abserror_20(i,j);
        if errorval20 > compare20
        compare20 = errorval20;
        end
    end
end

compare40 = 0;
for i = 1:N40-1
    for j = 1:M40-1
        errorval40 = abserror_40(i,j);
        if errorval40 > compare40
        compare40 = errorval40;
        end
    end
end


%Sums the square of errors
sum10 = 0;
for i = 1:N10-1
    for j = 1:M10-1
        sum10 = sum10 + (abserror_10(i,j))^2;
    end
end

sum20 = 0;
for i = 1:N20-1
    for j = 1:M20-1
        sum20 = sum20 + (abserror_20(i,j))^2;
    end
end

sum40 = 0;
for i = 1:N40-1
    for j = 1:M40-1
        sum40 = sum40 + (abserror_40(i,j))^2;
    end
end

h10 = (b-a)/N10;
h20 = (b-a)/N20;
h40 = (b-a)/N40;

gridsize = [h10,h20,h40];
l2norm = [ vpa((h10^2)*sum10,5), vpa((h20^2)*sum20,5), vpa((h40^2)*sum40,5)];
Error_in_max = [compare10,compare20,compare40]; 

figure
mesh(x_10,y_10,abserror_10)
title('Errors N=10')
figure
mesh(x_20,y_20,abserror_20)
title('Errors N=20')
figure
mesh(x_40,y_40,abserror_40)
title('Errors N=40')


figure
plot(gridsize,l2norm,'b',gridsize,Error_in_max,'r')
legend('l-2 norm','l-Inf norm','location','northeast')



%% Part 5


display('--------Overall accuracy-------')

(compare10^2)/(compare20^2)
(compare20^2)/(compare40^2)
%This is not h^2 + k^2 order















