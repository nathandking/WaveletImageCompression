clear all
close all

Lena = imread('Lena512.png');     % read in image
XX = double(Lena);                 % convert values to doubles


[C, S] = wavedec2(XX,2,'haar');

C = mat2gray(C);

A = reshape(C(1:S(1,1)^2),S(1,:));

H1 = reshape(C(S(1,1)^2+1:2*S(2,1)^2),S(2,:));
V1 = reshape(C(2*S(2,1)^2+1:3*S(2,1)^2),S(2,:));
D1 = reshape(C(3*S(2,1)^2+1:4*S(2,1)^2),S(2,:));

H2 = reshape(C(4*S(2,1)^2+1:4*S(2,1)^2+S(3,1)^2),S(3,:));
V2 = reshape(C(4*S(2,1)^2+S(3,1)^2+1:4*S(2,1)^2+2*S(3,1)^2),S(3,:));
D2 = reshape(C(4*S(2,1)^2+2*S(3,1)^2+1:4*S(2,1)^2+3*S(3,1)^2),S(3,:));


E = [A,V1; H1, D1];
X = [E, V2; H2, D2];
imshow(X)
imwrite(X,'../Tex/Images/WaveletDecomp.png','png');