function wigner()

% TO COMPARE TWO PLOTS    
    colormap jet;
    plotWigner([2.0 0]);
    
%     figure
%     colormap jet;
%     plotWigner([2.0 pi]);
    
%     for j=1:0.5:10
%         %plotWigner([alpha phi])
%         
%         plotWigner([j*0.5 0]) 
%         %plotWigner([3.0 j*pi/5.0])
%         drawnow
%         
%         %w=waitforbuttonpress
%         %if w==0 %button click
%         %    j=j+1
%         %end
%     end
end
function f=trRhoD(lambda,param)
    par=param(1);
    phi=param(2);
    %par=3.0;
    %phi=0; %pi/5.0;
    phiPhase=exp(phi*i);
    alpha=par + par*1i;
    beta=-par - par*1i;

    f1=cohIn(alpha,alpha+lambda).*dPhase(lambda,alpha);
    f2=cohIn(beta,alpha+lambda).*dPhase(lambda,alpha)*phiPhase;
    f3=cohIn(alpha,beta+lambda).*dPhase(lambda,beta)*conj(phiPhase);
    f4=cohIn(beta,beta+lambda).*dPhase(lambda,beta);
    
    %mixed state
    %f=f1+f4;
    %superposition state
    f=f1+f2+f3+f4;

end


function out=dPhase(alpha,beta)
    out=exp(1i*imag(alpha*conj(beta)));
end

function out = cohIn(alpha,beta)
    %both versions work fine :)
    out=exp(-0.5*(abs(alpha).^2)-0.5*(abs(beta).^2) + conj(alpha).*(beta));
    %out=exp(-0.5*(abs(alpha-beta).^2) + i*(imag(conj(alpha)*beta)));
end

function plotWigner(param)
    res=20;
    %you have no clue how crucial it is to add a 1
    max=(res*10) + 1;
    xMax=res;

    r_d=linspace(-xMax,xMax,max);
    x=repmat(r_d,max,1);
    y=repmat(r_d',1,max);
    lambda=x+1i*y;

    f=trRhoD(lambda,param);

    w = fftshift(fft2(ifftshift(f)));
    
    subplot(2,2,1)
    contourf(real(w),40,'EdgeColor','none','LineStyle','none');    
    title(['real(W=ft[tr($\rho D(\lambda )$)]), $\phi=$' num2str(param(2)) ' $abs(\alpha)=$' num2str(param(1))],'interpreter','latex')

    subplot(2,2,2)
    contourf(imag(w),40,'EdgeColor','none','LineStyle','none');
    title('imag(W=ft[tr($\rho D(\lambda )$)])','interpreter','latex')



    subplot(2,2,3)
    surfc(real(lambda),imag(lambda),real(w),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
    title('real(W)','interpreter','latex')    

    subplot(2,2,4)
    surfc(real(lambda),imag(lambda),imag(w),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
    title('imag(W)','interpreter','latex')    


end
