function y = fmc(x)
% function y = fmc(x)
% 
% A program that simply computes the dot product of
% the vector x with itself (xTx)
% 
% On Input:
%   x:  a vector of real valued numbers
%
% On Outputs:
%   y:  the dot product of x with itself (scalar value)
%
% Author: Aneesh Komanduri

[m,k] = size(x);

% Make sure x is a column vector
if m ~= k && m == 1
  x = x';
end

y = dot(x',x);

end