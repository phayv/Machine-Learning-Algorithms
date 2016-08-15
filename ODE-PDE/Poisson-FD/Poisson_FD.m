function[w,x,y] = Poisson_FD(a,b,c,d,M,N,TOL,Max_IT,f,g)
%step 1
h = (b-a)/N;
k = (d-c)/M;

x = zeros(N-1,1);
y = zeros(M-1,1);

%TRUE VALUES
%x(1,1) = a;
%x(N+1,1) = b;
%y(1,1) = c;
%y(M+1,1) = d;

%step 2
for i = 1:N-1
    x(i) = a + (i)*h;
end

%step 3
for j = 1:M-1
    y(j) = c + (j)*k;
end

%step 4
w = zeros(N-1,M-1);

%step 5
lambda = (h^2)/(k^2);
mu = 2*(1+lambda);
l = 1;

%step 6
while l <= Max_IT
    
    %step 7
    z = ((-h^2)*f(x(1),y(M-1)) + g(a,y(M-1)) + lambda*g(x(1),d) + lambda*w(1,M-2) ...
        + w(2,M-1))/mu;
    NORM = abs(z-w(1,M-1));
    w(1,M-1) = z;
    
    %step 8
    for i = 2:N-2
        z = ((-h^2)*f(x(i),y(M-1)) + lambda*g(x(i),d) + w(i-1,M-1) + w(i+1,M-1) ...
            + lambda*w(i,M-2))/mu;
        
        if w(i,M-1) - z > NORM
            NORM = abs(w(i,M-1)-z);
        end
        w(i,M-1) = z;
    end
    
    %step 9
    z = ((-h^2)*f(x(N-1),y(M-1)) + g(b,y(M-1)) + lambda*g(x(N-1),d) + w(N-2,M-1) ...
        + lambda*w(N-1,M-2))/mu;
    
    if abs(w(N-1,M-1) - z) > NORM
        NORM = abs(w(N-1,M-1) - z);
    end
    w(N-1,M-1) = z;
        
    %step 10
    for j = M-2:-1:2
        %step 11
        z = ((-h^2)*f(x(1),y(j)) + g(a,y(j)) + lambda*w(1,j+1) + lambda*w(1,j-1) + w(2,j))/mu;
        
        if abs(w(1,j) - z) > NORM
            NORM = abs(w(1,j) - z);
        end
        w(1,j) = z;
        
        %step 12
            
        for k = 2:N-2 
            
            z = ((-h^2)*f(x(k),y(j)) + w(k-1,j) + lambda*w(k,j+1) + w(k+1,j) ...
                + lambda*w(k,j-1))/mu;
        
            if abs(w(k,j) - z) > NORM
                NORM = abs(w(k,j) - z);
            end
            w(k,j) = z;
        
        end
        %step 13
        z = ((-h^2)*f(x(N-1),y(j)) + g(b,y(j)) + w(N-2,j) + lambda*w(N-1,j+1) ...
               + lambda*w(N-1,j-1))/mu;
        if abs(w(N-1,j) - z) > NORM
            NORM = abs(w(N-1,j) - z);
        end
        w(N-1,j) = z;
   
    end
    
        
        %step 14
        z = ((-h^2)*f(x(1),y(1)) + g(a,y(1)) + lambda*g(x(1),c) + lambda*w(1,2) + w(2,1))/mu;
        
        if abs(w(1,1)-z) > NORM
            NORM = abs(w(1,1) - z);
        end
        w(1,1) = z;
        
        %step 15
        for k = 2:N-2
            z = ((-h^2)*f(x(k),y(1)) + lambda*g(x(k),c) + w(k-1,1) + lambda*w(k,2) ...
                + w(k+1,1))/mu;
            
            if abs(w(k,1) - z) > NORM
                NORM = abs(w(k,1)-z);
            end
            w(k,1) = z;
        end
        
        %step 16
        z = ((-h^2)*f(x(N-1),y(1)) + g(b,y(1)) + lambda*g(x(N-1),c) + w(N-2,1) ...
            + lambda*w(N-1,2))/mu;
        
        if abs(w(N-1,1)-z) > NORM
            NORM = abs(w(N-1,1) - z);
        end
        w(N-1,1) = z;
        
        %step 17
        if NORM <= TOL
            return
        end
        
        l = l+1;
end
%while loop end



end

