% Divided Difference %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [P,DivDiff] = Divided_Difference(X,Y,x)
%Takes input and outputsample points, and a point to interpolate
%Computes divided didfference and the interpolaing polynomial

%Copy error statements from HW 1
    [xn,xm]=size(X);
    [yn,ym]=size(Y);

    if xm ~= ym
        error('Mismatch of input and output array lengths')
    elseif xn ~= 1 || yn ~= 1
        error('Input and output arrays must only have one row')
    end

P = 0;  %initialize P for later use in summation
prod = ones(1,xm); %initialize product array
DivDiff = zeros(xm); %initialize the size of the divdiff array

for i = 1:xm
   for j = 1:i-1  %needs to be i-1, since F i,i not defined in notation
      DivDiff(i,j) = Fdiv(X,Y,i,j) %Fdiv is going to be recursive
      prod(i) = prod(i)*(x - X(j)); %prod of i-1 terms in loop
   end
   P = P + Fdiv(X,Y,i,i-1)*prod(i);
end
     

end

function d = Fdiv(X,Y,i,j)
    if j == 0
        d = Y(i); %i-th element of array Y
    else
        d = (Fdiv(X,Y,i,j-1) - Fdiv(X,Y,i-1,j-1) )/(X(i) - X(i-j));        
        %Taken from the recursive formula
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
