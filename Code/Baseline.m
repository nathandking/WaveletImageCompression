function Baseline(cratio,wname)
Lena = imread('lena.gif');     % read in image
X = double(Lena);                 % convert values to doubles
method = 'gbl_mmc_h';                   % method name
figure; image(X);         % plot original figure
colormap(gray(255));
axis square;
 
    
    % compress image
    [CR,BPP] = wcompress('c',X,'lena.wtc',method,...
        'wname',wname,'comprat',cratio)

    % decompress image
    Xc = wcompress('u','lena.wtc');

    % compute MSE and PSNR
    D = abs(double(X)-double(Xc)).^2;
    mse  = sum(D(:))/numel(X);
    psnr = 10*log10(255*255/mse);

    % plote the compressed image
    figure; image(Xc);
    colormap(gray(255))
    axis square;
    title('Compressed Image')
    xlabel({['Compression Ratio: ' num2str(100/CR,'%1.2f : 1')], ...
        ['BPP: ' num2str(BPP,'%3.2f')],['PSNR ' num2str(psnr,'%3.2f')]})
    XX = mat2gray(Xc);
    imwrite(XX,['../Tex/Images/',method,wname,...
        num2str(round(100/cratio)),'.png'],'png');

