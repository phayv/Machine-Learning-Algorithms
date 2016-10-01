function [t,w,H] = Adams_VPC(a,b,alpha,tol,hmax,hmin)
h = hmax;

FLAG = 1;
LAST = 0;

[w,t] = RK4(h,alpha,a);
H = [];
test_t = t(4) + h;
NFLAG = 1;
i = 5;


while FLAG == 1
    %predict w
    WP = w(i-1) + (h/24)*(55*f(t(i-1),w(i-1)) - 59*f(t(i-2),w(i-2)) ...
        + 37*f(t(i-3),w(i-3)) - 9*f(t(i-4),w(i-4)));
    %correct w 
    WC = w(i-1) + (h/24)*(9*f(test_t,WP) + 19*f(t(i-1),w(i-1)) ...
        - 5*f(t(i-2),w(i-2)) + f(t(i-3),w(i-3)));

    sigma = (19*abs(WC-WP))/(270*h);
    
    %Step 6
    
    %accept result
    if sigma <= tol
        %step 7        
        w(i) = WC;
        t(i) = test_t;
        H(end + 1) = h;       
        %stops it for last
        if LAST == 1
            FLAG = 0;
        %continue
        else
            i = i+1;
            NFLAG = 0;
            
            if sigma <= .1*tol || t(i-1) + h > b
                %step 12
                q = (TOL/(2*sigma))^(1/4);
                %step 13
                if q > 4
                    h = 4*h;
                else
                    h = q*h;
                end
                
                %step 14
                if h > hmax
                    h = hmax;
                end
                
                %step 15
                if t(i-1) + 4*h > b
                    h = (b - t(i-1))/4;
                    LAST = 1;
                end
                %step 16
                [w2, t2] = RK4(h,w(i),t(i));
                w = [w w2];
                t = [t t2];
                H(end+1) = h;
                NFLAG = 1;
                i = i + 3;
            end
        end
        
        
    %reject result    
    else
        %step 17
        q = (tol/(2*sigma))^(1/4);
        
        %step 18
        if q < .1
            h = .1*h;
        else
            h = q*h;
        end
        
        %step 19
        if h < hmin
            FLAG = 0;
            disp('hmin exceeded');
        else
            if NFLAG == 1
                i = i - 3;
                [w2,t2] = RK4(h,w(i),t(i));
                w(end+1) = w2(4);
                t(end+1) = t2(4);
                H(end+1) = h;
                i = i + 3;
                NFLAG = 1;
            end
        end
    
    end
    test_t = t(i-1) + h;
    FLAG = 0;
end


answer = 0;


end


