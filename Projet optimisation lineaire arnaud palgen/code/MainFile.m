% Mainfile to run 
clear all; close all; clc; 
tic;
% Load input data
load Example1
figure; 
imshow( reshape(xtilde,l,L) ); 
title('Image floutee et bruitee'); 

    
% Choose parameter and solve problem
lambda = 1e-4; 
x = deblurr(A,xtilde,lambda);

% Display solution
figure; 
imshow( reshape(x,l,L) ); 
title('Image defloutee et debruitee'); 

% Peut être utilisé pour affichier les valeurs de l'erreur relative
% en fonction de valeurs de lambda
%errors=testLambda(A,xtilde,xtrue);
%disp(errors);

% If xtrue is known, you can use it to display the relative error in %
%fprintf('L''erreur relative de reconstruciton L1 est de %2.2f %% \n', ... 
%norm(x-xtrue,1)/norm(xtrue,1)*100); 

toc,