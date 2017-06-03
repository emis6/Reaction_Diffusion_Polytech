function Y=champ_matrice(a,b,c,d)
    


A=[a b;c d];
[val, stab]=valpropres(A)
%TODO:
%cas valps>0
%cas vp1<0 et vp2>0
%cas valps<0

%equations de Lokta-Volterra
%x'=ax+by
%y'=cx+dy

n=20;


x=linspace(-10,10,n);
y=linspace(-4,4,n);
[X,Y]=meshgrid(x,y); % chaque ligne de X est une copie de x et chaque
%colonne de Y est une copie de y. X et Y sont des matrices carrees

u=zeros(n,n);

for i=1:n
    for j=1:n
       u(i,j)=a*X(i,j)+b*Y(i,j);
    end
    
end

v=zeros(n,n);
for i=1:n
    for j=1:n
       v(i,j)=c*X(i,j)+d*Y(i,j);
    end
    
end


%la fonction quiver a pour argument le tableau des points en x et le
%tableau des points en y, et les coordonnees en x et en y des vecteurs a y
%mettre
figure(1)
title(['a = ',num2str(a),' b =', num2str(b),' c=', num2str(c),' d=',num2str(d)]);
quiver(X,Y,u,v);
end

