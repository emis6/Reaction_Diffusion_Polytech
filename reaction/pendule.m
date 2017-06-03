%equation du pendule simple amorti

g=9.81; l=1; w=sqrt(g/l);

alpha=0;
n=40;

x=linspace(-4*pi,4*pi,n);
y=linspace(-10,10,n);
[X,Y]=meshgrid(x,y); % chaque ligne de X est une copie de x et chaque
%colonne de Y est une copie de y. X et Y sont des matrices carrees
u=zeros(n,n);

for i=1:n
    for j=1:n
       u(i,j)=Y(i,j);%a*X(i,j)*(1-b*Y(i,j));
    end
    
end

v=zeros(n,n);
for i=1:n
    for j=1:n
       v(i,j)=-w*w*sin(X(i,j))-alpha*Y(i,j);%c*Y(i,j)*(X(i,j)-d);
    end
    
end


%la fonction quiver a pour argument le tableau des points en x et le
%tableau des points en y, et les coordonnees en x et en y des vecteurs a y
%mettre
quiver(X,Y,u,v);
