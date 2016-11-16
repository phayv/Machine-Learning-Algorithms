# Fixed Point Method #
function fixedPointMethod(f,p0, ϵ, Nmax; history=false)
    history && (pHist = Float64[]) 
    i=0
    
    while i < Nmax
        i=i+1
        p = f(p0) 
        history && push!(pHist,p) 
        
        if abs(p-p0)<ϵ  
            return pHist
            #return p
        end
        
        p0 = p
    end
    error("Convergence not achieved within the specified number of iterations")
end
