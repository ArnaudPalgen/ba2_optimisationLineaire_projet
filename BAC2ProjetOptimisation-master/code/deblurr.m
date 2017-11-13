% Deblurring algorithm
%
% Given A and xtilde, solve the linear optimization problem: 
% 
% min_{0 <= x <= 1} ||A*xtilde - x||_1 + lambda ||x||_1 

function x = deblurr(A,xtilde,lambda) 

  n = length(xtilde);
  
  myA=[];
  
  %contrainte 1
  ti=eye(n,n); % matrice identite de taille n*n
  tiP=zeros(n,n);
  
  s1=-1*eye(n,n);
  s2=zeros(n,n);% matrice de 0 de taille n*n
  s3=zeros(n,n);
  s4=zeros(n,n);
  s5=zeros(n,n);
  
  myA1=[ti,tiP,s1,s2,s3,s4,s5,-A]; % on met les matrices ti, tiP, etc les unes a cote des autres
  
  %contrainte2
  
  ti=eye(n,n);
  tiP=zeros(n,n);
  
  s1=zeros(n,n);
  s2=-1*eye(n,n);
  s3=zeros(n,n);
  s4=zeros(n,n);
  s5=zeros(n,n);
  
  myA2=[ti,tiP,s1,s2,s3,s4,s5,A];
  
  %contrainte3
  
  ti=zeros(n,n);
  tiP=eye(n,n);
  
  s1=zeros(n,n);
  s2=zeros(n,n);
  s3=-1*eye(n,n);
  s4=zeros(n,n);
  s5=zeros(n,n);
  
  xi=-1*eye(n,n);
  
  myA3=[ti,tiP,s1,s2,s3,s4,s5,xi];
  
  %contrainte4
  
  ti=zeros(n,n);
  tiP=eye(n,n);
  
  s1=zeros(n,n);
  s2=zeros(n,n);
  s3=zeros(n,n);
  s4=-1*eye(n,n);
  s5=zeros(n,n);
  
  xi=eye(n,n);
  
  myA4=[ti,tiP,s1,s2,s3,s4,s5,xi];
  
  %contrainte5
  
  ti=zeros(n,n);
  tiP=zeros(n,n);
  
  s1=zeros(n,n);
  s2=zeros(n,n);
  s3=zeros(n,n);
  s4=zeros(n,n);
  s5=eye(n,n);
  
  xi=eye(n,n);
  
  myA5=[ti,tiP,s1,s2,s3,s4,s5,xi];
  
  myA=[myA1;myA2;myA3;myA4;myA5];%on met les matrices myA1, myA2, etc les unes en dessous des autres
  
  %matrice c
  
  c=[];
  
  cti(1:n,1:1)=1;% matrice colonne de n elements qui valent 1
  ctiP(1:n,1:1)=lambda;
  
  cs1(1:n,1:1)=0;
  cs2(1:n,1:1)=0;
  cs3(1:n,1:1)=0;
  cs4(1:n,1:1)=0;
  cs5(1:n,1:1)=0;
  
  cxi(1:n,1:1)=0;
  
  c=[cti;ctiP;cs1;cs2;cs3;cs4;cs5;cxi];
  
  %matrice b
  c3(1:n,1:1)=0;
  c5(1:n,1:1)=1;

  b=[-1*xtilde;xtilde;c3;c3;c5 ];
  
  %glpk

  x1=glpk(c,myA,b);
  x=x1(7*n+1:length(x1),1:1);% on prend les n dernieres valeurs sur les 8n valeurs car on a pas besoin des valeurs des ti, ti', s1, s2, etc
    %on a juste besoin des valeurs des xi

end