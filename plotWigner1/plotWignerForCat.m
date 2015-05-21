max=100;
half=max/2;
par=2.0;
xMax=16;
alpha=par+par*1i;
beta=-par-par*1i;
r_d=linspace(-xMax,xMax,max);
%x=repmat(r_d,max);
x=repmat(r_d,max,1);
y=repmat(r_d',1,max);
lambda=x+1i*y;
% f=exp(-0.5*( lambda.*conj(lambda) + conj(lambda).*alpha - conj(alpha).*lambda));
% f=exp(-abs(lambda - alpha).^2);

f1=exp(-0.5*(abs(alpha).^2) -0.5*(abs(alpha + lambda).^2) - conj(alpha).*(lambda+alpha));
f2=exp(-0.5*(abs(beta).^2) -0.5*(abs(alpha + lambda).^2) - conj(beta).*(lambda+alpha));
f3=exp(-0.5*(abs(alpha).^2) -0.5*(abs(beta + lambda).^2) - conj(alpha).*(lambda+beta));
f4=exp(-0.5*(abs(beta).^2) -0.5*(abs(beta + lambda).^2) - conj(beta).*(lambda+beta));

% 
%f=f1;
f=f1+f2+f3+f4;
% f=f1+f2+f3+f4;


% f=exp(-0.5*(abs(alpha).^2) -0.5*(abs(alpha + lambda).^2) - conj(alpha).*(lambda+alpha));
subplot(2,2,1)
contourf(real(f),10);
title('abs(f=tr($\rho D(\lambda )$))','interpreter','latex')
subplot(2,2,2)
contourf(imag(f),10);
%title('angle(f=tr($\rho D(\lambda )$))','interpreter','latex')

%w=fft2(f);
w=fftshift(f);
subplot(2,2,3)
%this half business is to fix the order..to get negative frequencies also..
%the -1 business is because according to my formula, the second axis must
%be negative
contourf(real(w([half:max 1:half],[half:-1:1 max:-1:half ])),10)
title('abs(W=fourierTransform(f))','interpreter','latex')
subplot(2,2,4)
contourf(imag(w([half:max 1:half],[half:-1:1 max:-1:half ])),10)
%title('angle(W=fourierTransform(f))','interpreter','latex')

% contourf(angle(w(1:100,1:100)),10)

% subplot(2,2,3);
% contourf(abs(w(1:100,1:100)),10)
% subplot(2,2,4);
% contourf(angle(w(1:100,1:100)),10)

% plot3(w)



% lambdaMat=x+i*y;
% lambda=reshape(lambdaMat,1,1000000)
% lambda=reshape(lambdaMat,1,1000000);
% f=exp(-0.5*( lambda.*conj(lambda) + conj(lambda).*alpha - conj(alpha).*lambda))
% f=exp(-0.5*( lambda.*conj(lambda) + conj(lambda).*alpha - conj(alpha).*lambda));
% w=fft(f)
