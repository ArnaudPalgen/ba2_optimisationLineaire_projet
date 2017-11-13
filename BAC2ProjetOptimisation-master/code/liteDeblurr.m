function x = liteDeblurr(A,xtilde,lambda) 

  n = length(xtilde);
  
  I1=eye(n,n);
  zero=zeros(n,n);
  
  myA=[I1,zero,-I1,zero,zero,zero,zero,-A;
  I1,zero,zero,-I1,zero,zero,zero,A;
  zero,I1,zero,zero,-I1,zero,zero,-I1;
  zero,I1,zero,zero,zero,-I1,zero,I1;
  zero,zero,zero,zero,zero,zero,I1,I1];
  
  %matrice c
  
  c=[];
  
  cti(1:n,1:1)=1;
  ctiP(1:n,1:1)=lambda;
  
  cn(1:n,1:1)=0;
  
  c=[cti;ctiP;cn;cn;cn;cn;cn;cn];
  
  %matrice b
  c3(1:n,:)=0;
  c5(1:n,:)=1;
  b=[-1*xtilde;xtilde;c3;c3;c5];
  
  %glpk
  sol=glpk(c,myA,b);
  x=sol(7*n+1:length(sol),1:1);
  
  %sol est un sommet du polyedre ?
  % 8n contraintes j'en ai 5n je dois en trouver 3n dans les contraintes de positivités
  #{
  nbrC=0;  nombre contraintes de positivite actives
  index=1;
  while nbrC<3*n
    if sol(index)==0
      nbrC=nbrC+1;
    end
    index=index+1;
  end
  
  ran=rank(myA);

  
  if nbrC+5*n ==8*n && ran+3*n == 8*n
    disp("La solution est bien un sommet du polyèdre");
  else
    disp("La solution n'est pas un sommet du polyèdre");
  end
  #}

end