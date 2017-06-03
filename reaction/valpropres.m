function [val, stabilite]=valpropres(A)
val =eig(A);

nb=sum(real(val)>=0)% 0 si l'expression n'est pas verifiee, 1 si l'expression est verifiee
%0 si vp negative , 1 si valeur propre positive
    %stabilite
    if nb==0
        stabilite = 'equilibre stable';
    else
        stabilite = 'equilibre instable';
    end
    
end
