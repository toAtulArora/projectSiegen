function wigner()
    res=20;
    max=res*10;

    par=3.0;
    xMax=res;
    phi=0; %pi/5.0;
    phiPhase=exp(phi*i);
    alpha=par + par*1i;
    beta=-par - par*1i;
    r_d=linspace(-xMax,xMax,max);
    x=repmat(r_d,max,1);
    y=repmat(r_d',1,max);
    lambda=x+1i*y;

    f1=cohIn(alpha,alpha+lambda).*dPhase(lambda,alpha);
    f2=cohIn(beta,alpha+lambda).*dPhase(lambda,alpha).*phiPhase;
    f3=cohIn(alpha,beta+lambda).*dPhase(lambda,beta).*conj(phiPhase);
    f4=cohIn(beta,beta+lambda).*dPhase(lambda,beta);
    
    %mixed state
    %f=f1+f4;
    %superposition state
    f=f1+f2+f3+f4;

    w = fftshift(fft2(ifftshift(f)));
    
    figure
    subplot(2,2,1)
    contourf(real(w),20)    
    title('real(W=ft[tr($\rho D(\lambda )$)])','interpreter','latex')
    subplot(2,2,2)
    contourf(imag(w),20)
    title('imag(W=ft[tr($\rho D(\lambda )$)])','interpreter','latex')




    subplot(2,2,3)
    surfc(real(lambda),imag(lambda),real(w),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
    title('real(W)','interpreter','latex')    

    subplot(2,2,4)
    surfc(real(lambda),imag(lambda),imag(w),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
    title('imag(W)','interpreter','latex')    


end


function out=dPhase(alpha,beta)
    out=exp(1i*imag(alpha*conj(beta)));
end

function out = cohIn(alpha,beta)
    %both versions work fine :)
    out=exp(-0.5*(abs(alpha).^2)-0.5*(abs(beta).^2) + conj(alpha).*(beta));
    %out=exp(-0.5*(abs(alpha-beta).^2) + i*(imag(conj(alpha)*beta)));
end