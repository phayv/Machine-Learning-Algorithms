% Hermite Interpolation %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function H=hermite(x,Y,YP,t)
n=size(x)
z(1)=x(1)
z(2)=x(1)

for i=1:n
    z(2*i-1)=x(i)
    z(2*i)=x(i)
    Q(2*i-1,1)=Y(i)
    Q(2*i,1)=Y(i)
    Q(2*i,2)=YP(i)
    
    if i~=1
        Q(2*i-1,2)=(Q(2*i-1,1)-Q(2*(i-1)))./(z(2*i-1)-z(2*(i-1)))
    end
    
end

for i=3:2n+1
    for j=3:i
        Q(i,j)=(Q(i,j-1)-Q(i-1,j-1))./(z(i)-z(i-(j-1)))
    end
end

H=Q(1,1)

for i=2:2*n+1
    H=H+Q(i,i).*mult(t,i,z)
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
