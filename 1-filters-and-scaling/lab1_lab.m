mImg = imread('currentImage.png');
%condImg = lab1condscale(mImg,mImg2);
%scaledImg = lab1linscale(mImg);
%boxFilteredImg = lab1locbox(mImg);
[lab1locmax,lab1locmin] = lab1locmaxmin(mImg);
figure;
imshow(lab1locmin);
