A = rand(5,5);
b = rand(5,1);

x1 = GE_backward_sub(A,b)
[Id,x2] = GE_backward_elim(A,b)
 