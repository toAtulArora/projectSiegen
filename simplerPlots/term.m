function out=term(n,pBar,xBar,L,h,x)
    %h=2*pi;
    hbar=h/(2*pi);
    out=exp(1i*xBar*n*(2*pi/L)) * exp(1i*x*((pBar+(n*h/L)))/hbar); 
end
