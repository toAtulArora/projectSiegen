function stateWigner()
    global L NN xMax max delta;
    L=1;
    NN=4;
    xMax=2;
    max=101;
    delta=0;
    r_d=linspace(-xMax,xMax,max);
    x=repmat(r_d,max,1);
    y=repmat(r_d',1,max);
    lambda=x+1i*y;
    w=psi(x,y);
    %w=wigner(1,1);
%     j=0;
%     k=0;
%     for xx = x
%         j=j+1
%         k=0;
%         for yy = y            
%             w(j,k)=wigner(xx,yy);
%             k=k+1;
%         end
%     end
    
    %w(1,1)
    %mesh(x,y,z)

%     subplot(2,1,2)
%     contourf(w,40,'EdgeColor','none','LineStyle','none');    
% 
%     subplot(2,1,1)
%     surfc(x,y,w,'EdgeColor','none','LineStyle','none','FaceLighting','phong');
    
    subplot(3,2,1)
    contourf(real(lambda),imag(lambda),real(w),40,'EdgeColor','none','LineStyle','none');    
%     title(['real(W=ft[tr($\rho D(\lambda )$)]), $\phi=$' num2str(param(2)) ' $abs(\alpha)=$' num2str(param(1))],'interpreter','latex')

    subplot(3,2,2)
    contourf(real(lambda),imag(lambda),imag(w),40,'EdgeColor','none','LineStyle','none');
%     title('imag(W=ft[tr($\rho D(\lambda )$)])','interpreter','latex')



    subplot(3,2,3)
    surfc(real(lambda),imag(lambda),real(w),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
%     title('real(W)','interpreter','latex')    

    subplot(3,2,4)
    surfc(real(lambda),imag(lambda),imag(w),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
%     title('imag(W)','interpreter','latex')    


    subplot(3,2,5)
    contourf(real(lambda),imag(lambda),abs(w),40,'EdgeColor','none','LineStyle','none');
%     title('real(W)','interpreter','latex')    

    subplot(3,2,6)
    surfc(real(lambda),imag(lambda),abs(w),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
%     title('imag(W)','interpreter','latex')    

%y=minusP(x);
    %plot(x,y)
end
function out=phiP(x)
    global L
    out=exp(-1./((L/3).^2 - (x.^2))) .* heaviside(-abs(x)+L/3) * 5000;    
end

function out=phi(x)
    global L
    out=phiP(x-(L/2));
end

function out=zeroP(x)
    global L NN
    out=0;
    for k = -NN/2:NN/2
        out=out+phi(x-((2*k + 1)*L));
    end        
end

function out=oneP(x)
    global L NN
    out=0;
    for k = -NN/2:NN/2
        out=out+phi(x-((2*k)*L));
    end        
end

function out=plusP(x)
    out=(oneP(x)+zeroP(x))/sqrt(2);
end

function out=minusP(x)
    out=(zeroP(x) - oneP(x))/sqrt(2);
end

function out=psi(x,y)
    global delta
    out=cos(delta)*(plusP(x).*minusP(y) - minusP(x).*plusP(y))/sqrt(2) + sin(delta)*1i*(plusP(x).*plusP(y) - minusP(x).*minusP(y))/sqrt(2);
end

function out=psiStar(x,y)
    out=conj(psi(x,y));
end

function out=wigner(xx,yy)
    global xMax max
    r_d=linspace(-xMax,xMax,max);
    x=repmat(r_d,max,1);
    y=repmat(r_d',1,max);

    out=fftshift(fft2(ifftshift(psi(xx - (x/2), yy - (y/2)) .* psiStar(xx + (x/2), yy + (y/2)))));
end