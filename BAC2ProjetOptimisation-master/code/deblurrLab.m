function x = deblurrLab(A,xtilde,lambda) 

  n = length(xtilde);
  
  one=eye(n,n);
  oneCol(1:n,1:1)=1;
  lambdaCol(1:n,1:1)=lambda;
  infini(1:n,1:1)=Inf;
  
  myA=[-one,A;%premier contrainte -t_i + a_ix <= xtilde_i
      -one,-A];%deuxieme contrainte  -t_i - a_ix <= -xtilde_i
  
  c=[oneCol;lambdaCol];
  
  b=[xtilde;-xtilde];
  
  lb=[oneCol*0;oneCol*0];%borne inf
  ub=[infini;oneCol];%borne sup
  
  options=optimoptions('linprog','Algorithm','interior-point');
  sol=linprog(c,myA,b,[],[],lb,ub,options);
  x=sol(n+1:length(sol),1:1);
  %decomenter pour afficher dans la console si la solution est un
  %sommet du polyèdre
  
  %estSommet(myA, sol, b, n);
end