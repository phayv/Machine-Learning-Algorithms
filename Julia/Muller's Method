# Muller's Method #
function rootMuellerMethod(f,p0,p1,p2, ϵ, Nmax; history = true )
    p0, p1, p2 = (p0 + 0*im,p1 + 0*im,p2 + 0*im)  # forcing p0,p1,p2 to be complex numbers
    
    hist=Float64[]
    
    h1 = p1 - p0
    h2 = p2 - p1
    delta1 = (f(p1) - f(p0))/ h1
    delta2 = (f(p2) - f(p1))/ h2
    d = (delta1 - delta2)/(h2 + h1)
    i = 3
    
    while i <= Nmax
        b = delta2 + h2*d
        D = sqrt(b^2 - 4*f(p2)*d)
        
        if abs(b-D)<abs(b+D)
            E = b+D
        else 
            E = b-D
        end
        
        h = (-2*f(p2))/E
        p = p2+h
        
        if abs(h)<ϵ
            return hist
        end
            
        p0 = p1
        p1 = p2
        p2=p
        h1 = p1 - p0
        h2 = p2 - p1
        delta1 = (f(p1)-f(p0))/h1
        delta2 = (f(p2)-f(p1))/h2
        d = (delta2 - delta1)/(h2 + h1)
        i = i+1
        history && (hist = ([p0 p1 p2][:]))  # hist vector for the succesive approximations
    #write the body of the function in here
            print(hist)
    end
    
    error ("Method failed after Nmax iterations.")

end
