# Newton's Method #
function newtonMethod(f,dfdx, p0, ϵ, Nmax; history=false)
    
    history && (pHist = [p0][:])
    
    for i = 1:Nmax
        p = p0 - f(p0)/dfdx(p0) 
        history && push!(pHist, p) 
        if abs(p-p0)<ϵ  
            return pHist
        end
        p0 = p 
    end
    error("Didn't converge after Nmax iterations")
    
end
