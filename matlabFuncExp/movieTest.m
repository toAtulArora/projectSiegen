figure
Z = peaks;
surf(Z)
axis tight manual
ax = gca;
ax.NextPlot = 'replaceChildren';


loops = 100;
F(loops) = struct('cdata',[],'colormap',[]);
for j = 1:loops
    X = sin(j*pi/10)*Z;
    surf(X,Z)
    drawnow
    F(j) = getframe;
end
%movie(F)

% Z = peaks;
% surf(Z)
% axis tight manual
% ax = gca;
% ax.NextPlot = 'replaceChildren';
% 
% loops = 40;
% F(loops) = struct('cdata',[],'colormap',[]);
% for j = 1:loops
%     X = sin(j*pi/10)*Z;
%     surf(X,Z)
%     drawnow
%     F(j) = getframe(gcf);
% end
% fig=figure
% movie(fig,F,2)