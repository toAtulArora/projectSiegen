N=1000
Nhalf=N/2.0 
x=linspace(-10,10,N);
f=exp(-(x).^2 + x.*100i); %sin(x); %+ sin(2.*x)
%f=fp;
%f=fftshift(fp);
%f=circshift(fp,[0 Nhalf]);
%w=circshift(fftshift(f), [0 Nhalf]);
w = fftshift(fft(ifftshift(f)));
%w=fft(f);

subplot(2,1,1);
plot(real(f))
hold on
plot(imag(f))
%subplot(2,2,2);
%plot(imag(f))

subplot(2,1,2);
plot(real(w))
hold on
plot(imag(w))
%subplot(2,2,4);
%plot(imag(w))
