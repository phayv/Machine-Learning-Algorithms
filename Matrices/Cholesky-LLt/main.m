clear all
%Test Example
%A2 = [4,-1,1;
%      -1,4.25,2.75;
%      1,2.75,3.5];
%b = rand(3,1)  
%[L,Lt] = Cholesky_LLt(A2);
%y = forward_substitution_lower(L,b);
%x = forward_substitution_upper(Lt,y)

A = generate_SPD_matrix(5);
b = rand(5,1);
[L,Lt] = Cholesky_LLt(A);

% LLt x = b
% Substitute: Lt x = y
% Solve: Ly = b
% Solve: Lt x = y

y = forward_substitution_lower(L,b);
x = forward_substitution_upper(Lt,y)

