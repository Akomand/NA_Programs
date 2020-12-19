function [x1, x2, errflag] = quadroot(a, b, c)
% function [x1,x2,errflag] = quadroot(a,b,c)
%
% quadroot computes the roots of a quadratic polynomial with real coefficients.
%
% On Input:
% a,b,c are real coefficients of the polynomial  p(x) = a x^2 + b x + c
%
% On Ouput:
% x1 and x2 are real numbers, either the roots of p or the real and imaginary parts of a
% complex pair of roots (see errflag below).
% errflag:
%    errflag = 0 means x1 and x2 are the real roots of p
%    errflag = -1 means x1 is the real part and x2 the imaginary part of a pair of complex roots.
%    errflag = 1 means quadroot failed (probably the coefficient a is too |small|), and
%                       x1 and x2 are set to NaN.
%
% No external function calls in quadroot.
% Author: Aneesh Komanduri
    

    if(a == 0)
        x1 = NaN;
        x2 = NaN;
        errflag = 1;
        return;
    end
    
    % Scale factor
    m = max(abs(a), max(abs(b), abs(c)));
    
    % Scale inputs
    a = a / m;
    b = b / m;
    c = c / m;

    % Calculate discriminant
    discriminant = b*b - 4*a*c;
    
    x1 = 0;
    x2 = 0;
    
    if(discriminant < 0) 
        x1 = -b / (2.0 * a);
        x2 = sqrt((abs(discriminant))) / (2.0 * a);
        errflag = -1; 
    elseif(discriminant >= 0)
        x1 = (-b + sqrt(discriminant)) / (2.0 * a);
        x2 = (-b - sqrt(discriminant)) / (2.0 * a);
        errflag = 0;
    end    
end
    
    
    
    