
close all
%alpha=0; beta=0;gamma=1; nt=10;nx=10;
xmax=1;tmax=1;nt=100;nx=10; alpha=0;beta=0;gamma=1;

u1=diffusion3(xmax,tmax,gamma,alpha,beta,nt,nx);
f=@(x)sin(pi*x/(delta_x*nx));
delta_x=xmax/nx;
delta_t=tmax/nt;
phi=@(x,t) sin(pi*x/(delta_x*nx))*exp(-gamma*pi*pi*t/(delta_x*nx)^2);
mu=gamma*delta_t/(delta_x*delta_x);
%diffusion CR
u3=zeros(nt,nx);
x=linspace(0,delta_x*nx,nx);
t=linspace(0,delta_t*nt,nt);

N = nx;

mu_v = zeros(1, N-1)
mu_v(1,:) = mu
u = zeros(N,N)

B = zeros(N, N);
C = zeros(N, N);

B(1:N+1:end) = 1 + mu;
C(1:N+1: end) = 1- mu;

B = B + diag(-(1/2).*mu_v, -1);
B = B+ diag(-(1/2).*mu_v, +1)

C = C+ diag((1/2).*mu_v,-1) + diag((1/2).*mu_v,+1)

u(1,:) = f(x) %idk what!?
u(:,1)=alpha;
u(:,N)=beta;

for i = 1:N-1
    u(i+1, :) = B\ C*(u(i,:)');
end

u(:,1)=alpha;
u(:,N)=beta;

for it=1:nx
    subplot(2,1,1)
    title('methode explicite directe')
    plot(x,u1(it,:))
    hold on
    plot(x,phi(x,t(it)),'m+')
    hold on
    subplot(2,1,2)
    title('methode CR avec mat')
    plot(x,u(it,:))
    hold on
    plot(x,phi(x,t(it)),'m+')
    hold on
end
figure(2);
s = surf(x, t, u3)
set(s, 'EdgeColor', 'none', 'FaceColor', 'interp'); % Sets up the colors
xlabel('x') 
ylabel('t') 
zlabel('u')

figure(3);
p = pcolor(x, t, u3);
set(p, 'EdgeColor', 'none', 'FaceColor', 'interp');


