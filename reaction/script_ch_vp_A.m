%definition de la matrice pour n=2
%cas stable : 
a=1;b=6;c=-3;d=-5; %Re(lambda)<0 stable 
figure(1)
Y1=champ_matrice(a,b,c,d);

% %cas instable : 
%a=2; b=100; c=20 ;d=-10; %lambda >0 et lambda <0
%figure(2)
%Y2=champ_matrice(a,b,c,d);
% 
% %cas instable: 
%a=8;b=6;c=1;d=3; %lamdas>0
%figure(3)
%Y3=champ_matrice(a,b,c,d);