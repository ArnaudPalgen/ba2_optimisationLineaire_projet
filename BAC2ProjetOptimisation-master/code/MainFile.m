% Mainfile to run 
clear all; close all; clc; 
tic;
% Load input data
load Example2
figure; 
imshow( reshape(xtilde,l,L) ); 
title('Image floutee et bruitee'); 

    
% Choose parameter and solve problem
lambda = 1e-4; 
%lambda=0;
x = deblurrLab(A,xtilde,lambda);

% Display solution
figure; 
imshow( reshape(x,l,L) ); 
title('Image defloutee et debruitee'); 
%errors=testLambda(A,xtilde,xtrue);
%disp(errors);
% If xtrue is known, you can use it to display the relative error in %
%fprintf('L''erreur relative de reconstruciton L1 est de %2.2f %% \n', ... 
%norm(x-xtrue,1)/norm(xtrue,1)*100); 
toc,