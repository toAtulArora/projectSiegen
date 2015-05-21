N=100
Nhalf=N/2.0 
x=linspace(-10,10,N);
f=exp(-10.*(x).^2); %sin(x); %+ sin(2.*x)
%f=fp;
%f=fftshift(fp);
%f=circshift(fp,[0 Nhalf]);
%w=circshift(fftshift(f), [0 Nhalf]);
w = fftshift(fft(ifftshift(f)))
%w=fft(f);

subplot(2,2,1);
plot(real(f))
subplot(2,2,2);
plot(imag(f))

subplot(2,2,3);
plot(real(w))
subplot(2,2,4);
plot(imag(w))
