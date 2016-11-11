function [H,QDivDiff] = hermite(X,Y,YP,x)
%main computes the hermite Interpolating polynomial of degree 2n
%As well as an array of generalized divided differences QDivDiff

%Going modify error statements from HW1!
    [xn,xm] = size(X);
    [yn,ym] = size(Y);
    [ypn,ypm] = size(YP);
        if xm ~= ym || ypm ~= xm	%check size of X, Y, and YP
            error('Mismatch of input and output array lengths.')
        elseif xn~=1 || yn~=1 || ypn ~=1	%check if one row
            error('Input and output arrays must only have one row.')
        end
    
H = 0;								%init. H for use in summation loop
prod = ones(1,2*xm);            	%init. product array
QDivDiff = zeros(2*xm-1);         	%init. size of QDivDiff
ZX = zeros(1,2*xm);                 %init. repeated inputs for z values
ZY = zeros(1,2*xm);                 %init. repeated outputs for z values
for l = 1:xm;
    ZX(2*l-1) = X(l);
	ZX(2*l) = X(l);
	ZY(2*l-1) = Y(l);
	ZY(2*l) = Y(l);
end
for i = 1:2*xm
    for j = 1:i-1               
        QDivDiff(i,j) = Qdiv(ZX,ZY,YP,i,j);     
        %QDivDiff's ith row and jth column should be Q_i,j, when defined.
        %Qdiv is going to be a recursive function.
        prod(i) = prod(i)*(x - ZX(j));			%product of i-1 terms in loop
    end
    H = H + Qdiv(ZX,ZY,YP,i,i-1)*prod(i);		%adds each term in sum formula, including products
end


end

function d = Qdiv(ZX,ZY,YP,i,j)
if j == 0
    d = ZY(i);		%ith element of array ZY
elseif j == 1 && mod(i,2) == 0
	d = YP(0.5*i);	
	%for j= 1, even indices of i require Qdiv to take values from the derivative array YP.
else
    d = (Qdiv(ZX,ZY,YP,i,j-1) - Qdiv(ZX,ZY,YP,i-1,j-1))/(ZX(i) - ZX(i-j));
    %taken from recursive formula on sheet
end
end

