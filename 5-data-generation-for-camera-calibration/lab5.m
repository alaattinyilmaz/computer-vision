img = imread('calibrationObjectLab5.jpeg');

 [row,col,ch] = size(img);
 if(ch==3)
    img = rgb2gray(img);
 end

img2 =  edge(img,'Canny',[0.1 0.4]);

[H,T,R,edges,P,lines] = lab5calibprep(img);

subplot(1,2,1);
imshow(img2);
title('calibrationObjectLab5.jpeg edges');
axis on, axis normal, hold on;

subplot(1,2,2);
imshow(img);
title('Corners');
axis on, axis normal, hold on;

lab5drawlines(lines,45,35);
lab5drawlines(lines,45,14);
lab5drawlines(lines,81,60);
lab5drawlines(lines,2,71);
lab5drawlines(lines,17,69);
lab5drawlines(lines,2,69);
lab5drawlines(lines,4,68);
lab5drawlines(lines,66,42);

axis on, axis normal, hold on;
corners = corner(img,'Harris');
plot(corners(:,1),corners(:,2),'r*');
 
