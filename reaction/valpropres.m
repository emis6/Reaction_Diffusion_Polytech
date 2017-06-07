function [val, stabilite]=valpropres(A)
%determines stabilite of a system: Y' = AY
val =eig(A);

nb=sum(real(val)>=0)% 0 si l'expression n'est pas verifiee, 1 si l'expression est verifiee
