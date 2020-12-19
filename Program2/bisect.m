function [l, r, nf] = bisect(fname, a, b, tol)
% function [l, r, nf] = bisect(fname, a, b, tol)
%
% bisect computes a root bracketing interval
% in which the root of the function fname is located 
% up to an error tolerance
%
% On Input:
% fname - name of the function for which we are trying to find the root
% a,b - endpoints of the initial root bracketing interval
% tol - tolerance for error for when to stop the algorithm
%
% On Ouput:
% l, r are real numbers, the endpoints of the final root bracketing
% interval (within tolerance) in which the root is located
% nf - number of funtion evalutions until convergence
%
% Error Handling:
% If the method fails to converge to tol in 10^6 iterations, return nf = -1
%
% External Function Calls:
% fofx
% Author: Aneesh Komanduri

    % Evaluate at the two endpoints
    fa = feval(fname, a);
    fb = feval(fname, b);
    
    if(sign(fa) == sign(fb))
        error('Invalid root bracketing interval')
    end
     
    nf = 0;
    l = a;
    r = b;
    
    while(abs(l - r) > tol)
        p = (a + b) / 2;
        fp = feval(fname, p);
        
        % If exact root is found
        if(fp == 0)
           l = a;
           r = b;
           nf = nf + 1;
           return;
        end
        
        
        if(sign(fp) ~= sign(fa))
            b = p;
        else
            a = p;
        end
        
        nf = nf + 1;
        
        % Return after 10^6 iterations
        if(nf > 10^6)
            nf = -1;
            break;
        end
        
        l = a;
        r = b;
    end
end