img = imread('checkecboard.jpg');
%img = imread('leopard.jpg');
%img = imread('gates.jpg');
%img = imread('eiffel.jpg');
%img = imread('rome.png');

img = rgb2gray(img);
        
cannyedge = edge(img,'Canny');
prewittedge = edge(img,'Prewitt');
robertsedge = edge(img,'Roberts');
logedge = edge(img,'log');

figure;
subplot(3,2,1);
imshow(img);
title('Normal Image');

subplot(3,2,2);
imshow(cannyedge);
title('Canny Edge Detection');

subplot(3,2,3);
imshow(robertsedge);
title('Roberts Edge Detection');   

subplot(3,2,4);
imshow(prewittedge);
title('Prewitt Edge Detection');

subplot(3,2,5);
imshow(logedge);
title('Log Filtered Edge Detection');

% cannyedge2 = edge(img,'Canny',[0.1 0.4]);

% robertsedge2 = edge(img,'Roberts',0.01); % Thresholding
% robertsedge3 = edge(img,'Roberts', 'horizontal'); % Horizontal Edge Detection
% robertsedge4 = edge(img,'Roberts', 'vertical'); % Vertical Edge Detection

% prewittedge2 = edge(img,'Prewitt',0.01); % Thresholding
% prewittedge3 = edge(img,'Prewitt', 'horizontal'); % Horizontal Edge Detection
% prewittedge4 = edge(img,'Prewitt', 'vertical'); % Vertical Edge Detection

% logedge2 = edge(img,'log',0.01); % Thresholding

%{ 
cannyedge2 = edge(img,'Canny',[0.1 0.4]);
cannyedge3 = edge(img,'Canny',[0.3 0.8]);
cannyedge4 = edge(img,'Canny',[0.6 0.85]);
cannyedge5 = edge(img,'Canny',[0.05 0.8]);
figure;
subplot(3,2,1);
imshow(img);
title('Normal Image');

subplot(3,2,2);
imshow(cannyedge);
title('Canny Edge Detection [0.05 0.1]');

subplot(3,2,3);
imshow(cannyedge2);
title('Canny Edge Detection [0.1 0.4]');

subplot(3,2,4);
imshow(cannyedge3);
title('Canny Edge Detection [0.3 0.8]');

subplot(3,2,5);
imshow(cannyedge4);
title('Canny Edge Detection [0.6 0.85]');

subplot(3,2,6);
imshow(cannyedge5);
title('Canny Edge Detection [0.05 0.8]');

%}

%{
 
figure;
subplot(3,2,1);
imshow(img);
title('Normal Image');

subplot(3,2,2);
imshow(cannyedge);
title('Canny Edge Detection');

subplot(3,2,3);
imshow(prewittedge);
title('Prewitt Edge Detection');

subplot(3,2,4);
imshow(logedge);
title('Log Filtered Edge Detection');

subplot(3,2,5);
imshow(robertsedge);
title('Roberts Edge Detection');   

%}