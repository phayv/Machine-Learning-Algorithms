function y = f_lagrange(X,Y,x)

    y=0;
    [xn,xm]=size(X);
    [yn,ym]=size(Y);

%checking dimensions
    if xm ~= ym
        error('Mismatch of input and output array lengths')
    elseif xn ~= 1 || yn ~= 1
        error('Input and output arrays must only have one row')
    end

%loop
    for i = 1:xm
        y = y + Y(i)*Lk(X,i,x);
    
    end
end

function w = Lk(X,i,x)
w = 1;
[~,xm] = size(X); % ~ keeps matlab from storing the variable in the 1st coord

%need to remove ith element from X
%build array A without X(i)
if i == 1
    A = X([2:end]); %all but first element of X
elseif i == xm
    A = X([1:xm-1]);
else
    A = X([1:i-1,i+1:end]);
end

for j = 1:numel(A) %numel(A) is the length of A
   w = w*(x-A(j))./(X(i)-A(j));  %multiplies terms together
end


end
















