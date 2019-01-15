% Gaussian Filter
%img = imread('jump.png')
%filteredimg = lab2gaussfilt(img);

%[hor,ver] = lab2sobelfilt(imread('house.png'));

% Median Filter
%img = imread('tiger.png')
%filteredimg = lab2medfilt(img);


% Sharpening
img = imread('mother.png')
filteredimg = lab2sharpen(img,1,2);
filteredimg2 = lab2sharpen(img,2,2);
filteredimg3 = lab2sharpen(img,3,2);

% Sharpening
%img = imread('mother.png')
%filteredimg = lab2sharpen(img,1,3);
%filteredimg2 = lab2sharpen(img,2,3);
%filteredimg3 = lab2sharpen(img,3,3);

% Median Filter
%img = imread('tiger.png')
%filteredimage = lab2medfilt(img);
%[ver,hor] = lab2sobelfilt(img);

figure;
subplot(1,4,1);
imshow(img);
title('Normal Image');

subplot(1,4,2);
imshow(filteredimg);
title('Median Filtered Image k = 2');

subplot(1,4,3);
imshow(filteredimg2);
title('Median Filtered Image k = 5');

subplot(1,4,4);
imshow(filteredimg3);
title('Median Filtered Image k = 5');

%subplot(1,3,3);
%imshow(ver);
%title('Vertical Sobel Filtered');

