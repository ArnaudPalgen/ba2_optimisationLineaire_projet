% Retourne une matrice contenant les valeurs des erreur 
% relative de reconstruciton en fonction des valeurs de lambda
%
% Premiere colonne: valeur de lambda
% Deuxieme colonne: erreur relative de reconstruciton

function errors = testLambda (A,xtilde,xtrue)
    
    errors=[0,0;1,0;1e-1,0;1e-2,0;1e-3,0;1e-4,0;1e-5,0;1e-6,0;1e-7,0;1e-8,0;1e-9,0;1e-10,0];

    for i=1: length(errors)
        lambda=errors(i,1);
        x = deblurrLab(A,xtilde,lambda);
        erreur=norm(x-xtrue,1)/norm(xtrue,1)*100;
        errors(i,2)=erreur;
    end
end