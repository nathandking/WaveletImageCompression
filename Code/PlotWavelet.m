% Set number of iterations and wavelet name. 
iter = 20;
wav = 'db4';

% Compute approximations of the wavelet function using the
% cascade algorithm. 
[phi,psi,xval] = wavefun(wav,iter); 
%xl = -0.1:0.01:0;
%xr = 1:0.01:1.1;
plot(xval,-psi,'k')%,xl,zeros(size(xl)),'k',xr,zeros(size(xr)),'k'); 
xlabel('$x$','Interpreter','latex','FontSize',30)
ylabel('$\psi(x)$','Interpreter','latex','FontSize',30)
%axis([-0.1 1.1 -1.2 1.2])
set(gca,'FontSize',18)

