
%equations de Lokta-Volterra
%x'=ax(1-by)
%y'=cy(x-d)
a=2;
b=1;
c=1;
d=1;
n=20;


x=linspace(0,3,n);
y=linspace(0,4,n);
[X,Y]=meshgrid(x,y); % chaque ligne de X est une copie de x et chaque
%colonne de Y est une copie de y. X et Y sont des matrices carrees

u=zeros(n,n);

for i=1:n
    for j=1:n
       u(i,j)=(a-b*Y(i,j))*X(i,j);%a*X(i,j)*(1-b*Y(i,j));
    end
    
end

v=zeros(n,n);
for i=1:n
    for j=1:n
       v(i,j)=(-c+d*X(i,j))*Y(i,j);%c*Y(i,j)*(X(i,j)-d);
    end
    
end


%la fonction quiver a pour argument le tableau des points en x et le
%tableau des points en y, et les coordonnees en x et en y des vecteurs a y
%mettre
quiver(X,Y,u,v);
