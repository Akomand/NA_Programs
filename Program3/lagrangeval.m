function p = lagrangeval(x,y,w)
% function p = lagrangeval(x, y, w)
%
% lagrangeval computes a lagrange interpolating polynomial
% of degree at most the number of knots and evaluates the
% interpolating polynomial at each value in vector w
%
% On Input:
% x - a vector of x-values of the knots
% y - a vector of the y-values of the knots
% w - a vector of inputs to evaluate the interpolating polynomial at
%
% On Ouput:
% p - a vector of approximate values of the interpolating polynomial
% evaluated at a set of inputs (w).
%
% Error Handling:
% If the denominator of the Neville's Method iteration is 0,
% set denominator to the machine epsilon.
%
% No External Function Calls
% Author: Aneesh Komanduri

n = length(x) - 1;
w_s = length(w);
p = 1:w_s;

Q = zeros(n+1, n+1);
Q(:,1) = y;  % First column of matrix is function values



% Neville's Method
for k = 1:w_s
    for i = 1:n
        for j = 1:i
            denominator = (x(i+1) - x(i-j+1));
            % Check if Denominator is 0
            if(denominator == 0)
                denominator = 2e-53;
            end
            
            Q(i+1,j+1) = ((w(k)-x(i-j+1))*Q(i+1,j) - (w(k) - x(i+1))*Q(i,j)) / denominator;
        end
    end
    p(k) = Q(n+1, n+1);
end

end



