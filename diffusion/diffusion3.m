function u =diffusion3(xmax,tmax,gamma,alpha,beta,nt,nx)
%Finds the solution of a heat equation with an explicit method%

%initializing the variables:
delta_x=xmax/nx;
delta_t=tmax/nt;
mu=gamma*delta_t/(delta_x*delta_x);
u=zeros(nt,nx);
f=@(x)sin(pi*x/(xmax));
x=linspace(0,xmax,nx);
t=linspace(0,tmax,nt);

%conditions initiales et aux limites
u(1,:)=f(x);
u(:,1)=alpha;
u(:,nx)=beta;

hold on
for it=1:nt
    for ix=2:nx-1
        u(it+1,ix)=mu*u(it,ix+1)+(1-2*mu)*u(it,ix) + mu*u(it,ix-1);  
    end
end          

end


