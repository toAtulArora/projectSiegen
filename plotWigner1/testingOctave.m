max=100;
half=max/2;
par=4.0;
xMax=16;
alpha=par+par*1i;
beta=-par-par*1i;
r_d=linspace(-xMax,xMax,max);
x=repmat(r_d,max);
x=repmat(r_d,max,1);
y=repmat(r_d',1,max);
lambda=x+1i*y;


f1=exp(-0.5*(abs(alpha).^2) -0.5*(abs(alpha + lambda).^2) - conj(alpha).*(lambda+alpha));
f2=exp(-0.5*(abs(beta).^2) -0.5*(abs(alpha + lambda).^2) - conj(beta).*(lambda+alpha));
f3=exp(-0.5*(abs(alpha).^2) -0.5*(abs(beta + lambda).^2) - conj(alpha).*(lambda+beta));
f4=exp(-0.5*(abs(beta).^2) -0.5*(abs(beta + lambda).^2) - conj(beta).*(lambda+beta));

f=f1+f2+f3+f4;



%contourf(abs(f),10)		

subplot(2,2,1)
contourf(abs(f),10);
title('abs(f=tr($\rho D(\lambda )$))','interpreter','latex')
%subplot(2,2,2)
%contourf(arg(f),10);
%title('angle(f=tr($\rho D(\lambda )$))','interpreter','latex')
