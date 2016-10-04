A = rand(5,5);
b = rand(5,1);

x1 = GE_SPP(A,b)
x2 = GE_max_col_pivot(A,b)
x3 = GE_backward_sub(A,b)
x4 = GE_CP(A,b)
