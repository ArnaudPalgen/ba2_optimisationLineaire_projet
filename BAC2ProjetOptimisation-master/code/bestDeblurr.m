function x = bestDeblurr(A,xtilde,lambda) 
  
  % ordre des variables: ti, s1i, s2i, xi
  % fonction a minimiser: sum from i=1 to n of ti+lambda*xi ( avec 0<=x<=1)
  %contraintes:
  %             ti-s1i-ai*x=-xi
  %             ti-s2i+ai*x=xi
%  
%  n = length(xtilde);
%  I1=eye(n,n);
%  I1Col=ones(n,1);
%  
%  zero1=zeros(n,1);
%  zero=zeros(n,n);
%  
%  infini(1:n,1:1)=Inf;
%  
%  lambda1(1:n,1:1)=lambda;
%  
%  myA=[I1, -I1, zero, -A; %premier contrainte
%  I1, zero, -I1, A];%deuxieme contrainte
%  
%  c=[I1Col; lambda1;zero1;zero1];
%  
%  b=[-xtilde; xtilde];
%  
%  lb=[zero1;zero1;zero1;zero1];
%  
%  ub=[infini;infini;infini;I1Col];
%  
%  sol=glpk(c,myA,b,lb,ub);
%  
%  x=sol(3*n+1:length(sol),1:1);

%  %sum(abs(myA*sol-b)<=0.0001)+sum(abs(sol)<=0.0001)+sum(abs(sol(1:n)-1)<=0.0001);

  n = length(xtilde);
  I1=eye(n,n);
  
  myA=[A -I1 ;
       -A -I1];%deuxieme contrainte
  
  c=[lambda*ones(n,1) ; ones(n,1)];
  
  b=[xtilde; -xtilde];
  
  lb=[zeros(2*n,1)];
  
  ub=[ones(n,1); Inf(n,1)];
  
  for i=1:size(myA,1)
  ctype(i)='U';
  end
  
  sol=glpk(c,myA,b,lb,ub,ctype);
  
  x=sol(1:n);
  
end
