bc  = 0.35; Du = 1;   Dv = 30;

%w = 10;  %no pattern 
w = 80;  % pattern
 
Nx = 500; 
x = linspace(0,w, Nx); 
dx = x(2) - x(1); 
 
dt = 1; 
t = 0:dt:400;   
Nt = length(t); 
 
% Set up for the surface 
[X, T] = meshgrid(x, t);
U = 0*X;
V = 0*X;

x = x(:);
t = t(:);
 
%Initial conditions: small perturbation away from steady state
u = 1/bc*ones(length(x),1) + 0.01*rand(Nx, 1); 
v = 1/bc^2*ones(length(x),1);

U(1,:) = u;
V(1,:) = v;

 
%implicit:
    a = (1+2*Du*dt/dx^2);
    b = Du*dt/dx^2;       
    main = a*sparse(ones(Nx,1)); 
    off  = -b*sparse(ones(Nx-1,1));
    Bu = diag(main) + diag(off,1) + diag(off,-1); 
    
    Bu(1, end-1) = -b; %boundries
    Bu(end, 2) = -b;
 
    a = (1+2*Dv*dt/dx^2); b = Dv*dt/dx^2;
    main = a*sparse(ones(Nx,1));
    off  = -b*sparse(ones(Nx-1,1));
    Bv = diag(main) + diag(off,1) + diag(off,-1);
    Bv(1, end-1) = -b;
    Bv(end, 2) = -b;
 
 
figure(1);
 
axis([-1 80 -.01 15.01])  

%Affichage des plot apres chaque pas de temp
for j = 1:Nt
    f = u.^2./v-bc*u;
    g = u.^2 - v;

    u = Bu\(u + dt*f);   % backward Euler
    v = Bv\(v + dt*g);
 
    plot(x,u,'g.-', 'linewidth',1);
    hold on;
    plot(x,v,'r.-', 'linewidth',1);
    hold off;
    axis([-1 80 -.01 15.01]);
    drawnow; 

    U(j,:) = u; %used in figure 2
    V(j,:) = v;
end
 
 

figure(2);
s = surf(x, t, U)
set(s, 'EdgeColor', 'none', 'FaceColor', 'interp');
xlabel('x') 
ylabel('t') 
zlabel('u')
 
figure(3);
p = pcolor(x, t, U);
set(p, 'EdgeColor', 'none', 'FaceColor', 'interp');