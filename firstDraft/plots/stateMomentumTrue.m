function stateMomentumTrue()
    global L NN xMax max h hbar;
    h=1;
    hbar=h/2*pi();
    L=1;
    NN=4;
    xMax=6;
    max=101;
    r_d=linspace(-xMax,xMax,max);
    pa=repmat(r_d,max,1);
    pb=repmat(r_d',1,max);
    lambda=pa+1i*pb;
    %w=fftshift(fft(ifftshift((psi(pa,pb)))));
    %w=psi(pa,pb).*conj(psi(pa,pb));
    w=abs(psi(pa,pb));
    
    subplot(2,2,1)
    contourf(real(lambda),imag(lambda),real(w),40,'EdgeColor','none','LineStyle','none');    
    title('$abs(\Psi(p_1,p_2));h=1,L=1,N=8$','interpreter','latex')
%     title(['real(W=ft[tr($\rho D(\lambda )$)]), $\phi=$' num2str(param(2)) ' $abs(\alpha)=$' num2str(param(1))],'interpreter','latex')

     subplot(2,2,2)
     contourf(real(lambda),imag(lambda),imag(w),40,'EdgeColor','none','LineStyle','none');
%     title('imag(W=ft[tr($\rho D(\lambda )$)])','interpreter','latex')



     subplot(2,2,3)
     surfc(real(lambda),imag(lambda),real(w),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
%     title('real(W)','interpreter','latex')    

     subplot(2,2,4)
     surfc(imag(lambda),imag(lambda),imag(w),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
%     title('imag(W)','interpreter','latex')    


%y=minusP(x);
    %plot(x,y)
end
function out=phiP(x)
    global L
    out=exp(-1./((L/3).^2 - (x.^2))) .* heaviside(-abs(x)+L/3) * 5000;    
end

%for the moment, I'm using a delta function; so its fourier transform is
%just e^ipx_0
function out=phi(p)
    global L hbar
    %out=phiP(x-(L/2));
    
    out=exp(1i*p*(L/2)/hbar);
    %exp(1i*p*(L/2)/hbar)
    %out=exp(1i*(L/2)/hbar);
end

function out=zeroP(p)
    global L NN hbar
    out=0;
    for k = -NN/2:NN/2
        out=out + (exp(1i*(2*k + 1)*p*(L/hbar) ) );%* phi(p));
    end        
    out=out.*phi(p);
end

function out=oneP(p)
    global L NN hbar
    out=0;
    for k = -NN/2:NN/2
        out=out + (exp(1i*(2*k)*p*(L/hbar) ) ); %  * phi(p));
        %out=out+phi(x-((2*k)*L));
    end
    out=out.*phi(p);
end

function out=plusP(p)
    out=(oneP(p)+zeroP(p))/sqrt(2);
end

function out=minusP(p)
    out=(zeroP(p) - oneP(p))/sqrt(2);
end

function out=psi(pa,pb)
    %out=abs(oneP(pa)*exp(1i*pa)).*abs(oneP(pb)*exp(1i*pb));
    %out=abs(pa.*exp(1i*pa)).*abs(pb.*exp(1i*pb));
    %out=abs(pa).*abs(pb);
    %out=oneP(pa).*oneP(pb);
    out=(plusP(pa).*minusP(pb) - minusP(pa).*plusP(pb))/sqrt(2);
end
