% Blurring matrix
%
% Given an input image X m-by-n, it returns a matrix A mn-by-mn such that 
% A vec(X) = y, and reshape(y) is the blurry image 
% 
% You do not need to ude this function, but if you want to play with your
% own images, this could be useful. 

function A = blurrmat(m,n,blur) 

A = zeros(m*n,m*n); 
for i = 1 : m
    for j = 1 : n
        % blurr for pixel at position (i,j) 
        indij = (j-1)*m + i; 
        for ik = i-blur:i+blur
            for jk = j-blur:j+blur 
                indijk = (jk-1)*m + ik; 
                if 1 <= ik && ik <= m && jk >= 1 && jk <= n     
                    A(indij,indijk) = 1 - (abs(i-ik)+abs(j-jk))/3/blur;           
                end
            end
        end
        A(indij,:) = A(indij,:) / sum(A(indij,:));
    end
end