clear all 
%Test Example
%A2 = [4,-1,1;
%      -1,4.25,2.75;
%      1,2.75,3.5];
%b = rand(3,1)  
%[L,Lt] = LDLt_Factorization(A2);
%y = forward_substitution_lower(L,b);
%x = forward_substitution_upper(D*Lt,y)

%works only for positive definite matrices (which are symmetric)
A = generate_SPD_matrix(5);
b = rand(5,1);

[L,D,Lt] = LDLt_Factorization(A);

% Equation: LDLt x = b
% Substitute: DLt x = y
% Solve: Ly = b
% Solve: DLt x = y

y = forward_substitution_lower(L,b);
x = forward_substitution_upper(D*Lt,y)
 
