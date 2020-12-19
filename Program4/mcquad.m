function s = mcquad(fcn,a,b,n)
% function s = mcquad(fcn,a,b,n)
%
% A program to approximate definite integrals over k-dimensional
% rectangular regions using Monte-Carlo approximation.
%
% On Input:
%	fcn: the string variable giving the 
%		 name of the m-file specifying function to be integrated
%	a:	a vector giving the lower bound endpoints [a0,...,ak]
%	b:	a vector giving the upper bound endpoints [b0,...,bk]
%	n:	the number of function samples
%
% On Output:
%	s: 	the approximated integral
%
% External Function Calls: fcn (fmc.m in this case)
%
% Author: Aneesh Komanduri

format short e;	

% Initializations
if size(a) ~= size(b)
  disp ('Region specified not valid...');
  return;
end

% Make sure vector is column vector
[m,k] = size(a);
if m ~= k && m == 1
  a = a';
end

% Make sure vector is column vector
[m,k] = size(b);
if m ~= k && m == 1
  b = b';
  m = k;
end

% Check that n is not a vector
if size(n) ~= [1,1]
  disp ('Num samples should be passed in as a scalar');
  return;
end

% Check that num samples is a positive number
if n < 1
  disp ('Number of samples should be at least 1');
  return;
end


% Monte-Carlo Algorithm
c = b-a;
v = prod(c);
s = 0;
x = zeros(1,length(a));

for i=1:n
  x = a + c.*rand(m,1);
  s = s + feval(fcn,x);
end

s = v * s / n;

end