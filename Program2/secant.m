function [x,nf] = secant(fname, x0, x1, tol)
% function [x,nf] = secant(fname, x0, x1, tol)
%
% secant computes a root of the function fname
%
% On Input:
% fname - name of the function for which we are trying to find the root
% x0,x1 - initial guesses of the root
% tol - tolerance of error for when to stop the algorithm
%
% On Ouput:
% x is a real number root of the function
% nf - number of funtion evalutions until convergence
%
% Error handling:
% If the method fails to converge to tol in 10^6 iterations, return nf = -1
%
% External Function Calls:
% fofx
% Author: Aneesh Komanduri

    fx0 = feval(fname, x0);
    fx1 = feval(fname, x1);
    
    % If difference of evaluated less than machine epsilon
    if(abs(fx1 - fx0) < eps)
        error('divide by zero error')
    end
    
    nf = 0;
    
    while(abs(x1 - x0) > tol)
        x = x1 - fx1 * ((x1 - x0) / (fx1 - fx0));
        x0 = x1;
        x1 = x;
        fx0 = fx1;
        fx1 = feval(fname, x1);
        nf = nf + 1;
        
        % Return after 10^6 iterations
        if(nf > 10^6)
            nf = -1;
            break;
        end
    end
    x = x1;
end