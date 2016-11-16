# Jacobi Iteration #
function JacobiIt(A,b; Nmax = 30, ϵ=1e-6, history = false)
   
     # This is the DLU composition
    L = tril(A,-1)
    U = triu(A,1)
    D = diagm(diag(A),0)
    
    N = D
    M = L + U

    
    x = zeros(size(A)[1])
    hist = x
    
    for i=1:Nmax 
    
        buffer = x
        x = N\(b-M*x)
 
        history && (hist = [hist x])
        
        if norm(x-buffer)/norm(x) < ϵ
            print("converged after ", i, " iterations \n")
            
            history && return hist[:,2:end]
            return x
        end
    
    end
    
    print("Error: didn't converge after ", Nmax ," iterations\n")
    
    
    
    
end
