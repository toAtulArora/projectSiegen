% This is to plot the simultaneous eigenvector of pmod and xmod
xBar=0.7;
pBar=10;
L=1.0;
h=2*pi;
xBarMax=L
pBarMax=h/L
nMax=100;


xMax=10;
x=-xMax:0.01:xMax;

n=-nMax:nMax;

eVp=zeros(1,size(x,2));

for i=n
    eVp=term(i,pBar,xBar,L,h,x)+eVp;
end

eVm=fftshift(fft(ifftshift(eVp)));

subplot(2,1,1)
plot (x,abs(eVp)); %abs(eigenVector))
subplot(2,1,2)

%y=-4:0.01:4;
%zoom on
mPlot=plot (x,abs(eVm));
zoom xon
zoom(10.0)

%plot (x,imag(eigenVector))

