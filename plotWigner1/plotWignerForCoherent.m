max=40
half=max/2
alpha=-1.5i;
r_d=linspace(-2*pi,2*pi,max);
x=repmat(r_d,max);
x=repmat(r_d,max,1);
y=repmat(r_d',1,max);
lambda=x+1i*y;
% f=exp(-0.5*( lambda.*conj(lambda) + conj(lambda).*alpha - conj(alpha).*lambda));
% f=exp(-abs(lambda - alpha).^2);
f=exp(-0.5*(abs(alpha).^2) -0.5*(abs(alpha + lambda).^2) - conj(alpha).*(lambda+alpha));
subplot(2,2,1);
contourf(abs(f),10);
subplot(2,2,2);
contourf(angle(f),10);

w=fft2(f);
subplot(2,2,3);
contourf(abs(w([half:max 1:half],[half:max 1:half])),10)
subplot(2,2,4);
contourf(angle(w([half:max 1:half],[half:max 1:half])),10)
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