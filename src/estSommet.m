%Affiche dans la console si la soltions est un sommet du poly�dre d contraintes myA

function estSommet(myA,sol,b,n)
  actives=[];
  prod=abs(myA*sol-b);
  for i=1:length(sol)
    if prod(i)<=0.0001 
        actives=[actives;myA(i:i,:)];
    end
  end
  activesEtLinInd=sum(sol<0.0001)+sum(abs(sol(1:n)-1)<0.0001);

  if rank(actives)+activesEtLinInd >=2*n
      disp("La solution est un sommet du poly�dre");
  else
      disp("la solution n'est pas un sommet du poly�dre");
  end

end
