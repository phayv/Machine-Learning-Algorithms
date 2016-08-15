function y = f_lagrange(X,Y,x) 	%X and Y determine coordinates of sample points, x is an interpolation point
    y = 0; 						%initialize y for later use in addition loop
    [xn,xm] = size(X);
    [yn,ym] = size(Y);
	if xm ~= ym 				%check size of X and Y
		error('Mismatch of input and output array lengths.')
	elseif xn~=1 || yn~=1 		%check if one row
	    error('Input and output arrays must only have one row.')
    end
    for i=1:xm
        y = y + Y(i)*Lk(X,i,x); %sum up interpolating polynomials
    end
end

function w = Lk(X,i,x)
    w = 1; 						%initialize w for later use in multiplication loop
    [~,xm] = size(X);
	%ifs and elses to remove the unwanted term from array X
    if i == 1
        A = X([2:end]);
    elseif i == xm
        A = X([1:xm-1]);
    else
        A = X([1:i-1, i+1:end]);
    end    
    for j=1:numel(A)
        w = w*(x - A(j))./(X(i)-A(j)); %multiply terms together
    end
end