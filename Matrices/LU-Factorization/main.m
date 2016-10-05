A = rand(5,5)
b = rand(5,1);

[L,U] = LU_Factorization(A)

% New Problem: LUx = b
% Substitute: Ux = y
% Solve: Ly = b
% Solve: Ux = y

y = forward_substitution_lower(L,b)
x = forward_substitution_upper(U,y)