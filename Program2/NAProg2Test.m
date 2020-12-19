%This is a script file to test the bisect and secant routines.
%
% Put it in the same folder as your other Matlab files and run it in the
% command window:
%     >> NAProg2Test
%
%It erases any file (in the Matlab path) called prog2run.txt, and
%writes output to a file in the Matlab working directory called prog2run.txt.
%
% Don't forget to email me bisect.m, secant.m, fofx.m, and prog2run.txt

if exist('prog2run.txt','file'),
    delete('prog2run.txt')
	disp(' ')
	disp('deleting old prog2run.txt file to make new one')
end

cf = get(0,'Format');
format long e
diary prog2run.txt

[l,r,nfb] = bisect('fofx',0.7,0.9,1e-11); %the true solution is pi/4
p = l+(r-l)/2;
disp(' ')
disp(' ')
disp('   Bisect output:')
disp('root approx:'),p
disp(' ')
disp('error:'),abs(p-pi/4)
disp(' ')
disp('number of fcn evals:'),nfb
disp(' ')
disp(' ')

[x,nfs] = secant('fofx',0.7,0.9,1e-11);
disp('   Secant output:')
disp('root approx:'),x
disp(' ')
disp('error:'),abs(x-pi/4) %the true solution is pi/4
disp(' ')
disp('number of fcn evals:'),nfs
diary off
format(cf);
