% NA_Prog4Test.m
%
% A test script for Monte-Carlo Integration (mcquad.m and fmc.m)
% 
% Author: Aneesh Komanduri

diary prog4run
format long e


% Initialize bound vectors and samples vector
a = [-1,-2,1,-2,0,1,0,-1,0,1,-1,4];
b = [2,1,2,0,2,2,2,1,2,3,1,5];
n = [64,512,4096,32768,262144,2097152];
exact = 43008;

% Iterate over length of n and call mcquad for each sample size n(i)
[m,k] = size(n);
for i=1:k
  S(i) = mcquad('fmc',a,b,n(i));
end

% Column vector integral
S = S';
S(k,4) = 0;

% Insert sample size (n), 1/sqrt(n), and relative error
for i=1:k
  S(i,2) = n(i);
  S(i,3) = 1/sqrt(n(i)); 
  S(i,4) = abs(exact-S(i,1)) / exact;
end

% Display table
disp(' approximation       n        1/sqrt(n)  relative error');
disp(S);
clearvars S
diary off;

return;