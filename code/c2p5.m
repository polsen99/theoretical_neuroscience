% mapping from cortex into the retina

lam=1.2   % constants for the map
ep0=1.0;

[X,Y]=meshgrid(0.05:.01:3,-2:.01:2);
             % global coordinates for the cortex

ep=ep0*(exp(X/lam)-1);              % eccentricity
a=-(180*(ep0+ep).*Y)./(lam*ep*pi);  % azimuth
in=abs(a)<90;                       
a=a.*(abs(a)<90)+90*(a>=90) - 90*(a<=-90);
                                    % take care of absurdities
clf;
K=8;
Theta=pi/6;
Phi=0;
s=cos(K*X*cos(Theta)+K*Y*sin(Theta)-Phi);
subplot(2,2,1);
imagesc(X(1,:),Y(:,1),s.*in);
set(gca,'fontsize',18,'fontname','palatino');
title('visual cortex');
xlabel('X (cm)');
ylabel('Y (cm)');
daspect([1 1.5 1]);
subplot(2,2,2);
contourf(ep.*cos(a*2*pi/360),ep.*sin(a*2*pi/360),s,'w:');
set(gca,'xlim',[0 12],'ylim',[-12 12]);
set(gca,'fontsize',18,'fontname','palatino');
title('visual space');
daspect([1 1 1]);
xlabel('degrees');
ylabel('degrees');
