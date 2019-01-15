img = imread('checker.jpg');

 [row,col,ch] = size(img);  
 if(ch==3)
    img = rgb2gray(img);
 end

%tic;
%[H,T,R,edges,P,lines] = lab4houghlines(img);
%toc;
circleimg = imread('circlesBrightDark.png');
%{
subplot(3,2,1);
imshow(img);
title('checker.jpg');
axis on, axis normal, hold on;

subplot(2,2,2);
imshow(imadjust(rescale(H)),'XData',T,'YData',R,...
      'InitialMagnification','fit');
title('Hough transform of checker.jpg');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

subplot(2,2,3);
% P  = houghpeaks(H,20);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
title('20 Peaks Hough Transform With Default (0.5 of maximum Hough points Threshold)');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','white');


subplot(2,2,4);
max_len = 0;
min_len = 100000000000;
imshow(img);
title('Longest and Shortest Lines, FillGap: 10, MinLength: 40');
axis on, axis normal, hold on;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
   
   if ( len < min_len)
      min_len = len;
      xy_short = xy;
   end  
end
axis on, axis normal, hold on;

 plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
 plot(xy_short(:,1),xy_short(:,2),'LineWidth',2,'Color','red');

 axis on, axis normal, hold on;
 


%}

subplot(1,3,1);
imshow(circleimg);
title('Circles 20<= Radius =<60');
[centersBright, radiiBright, centersDark, radiiDark] = lab4houghcircles(circleimg,20,60,0.85);
axis on, axis normal, hold on;
viscircles(centersBright, radiiBright,'Color','b');
axis on, axis normal, hold on;

subplot(1,3,2);
imshow(circleimg);
title('Circles 20<= Radius =<60 & Sensitivity: 0.9');
[centersBright, radiiBright, centersDark, radiiDark] = lab4houghcircles(circleimg,20,60,0.9);
axis on, axis normal, hold on;
viscircles(centersBright, radiiBright,'Color','b');
axis on, axis normal, hold on;

subplot(1,3,3);
imshow(circleimg);

title('Bright and Dark Circles 20<= Radius =<60 & Sensitivity: 0.99');
[centersBright, radiiBright, centersDark, radiiDark] = lab4houghcircles(circleimg,20,60,0.99);
axis on, axis normal, hold on;
viscircles(centersBright, radiiBright,'Color','b');
axis on, axis normal, hold on;
viscircles(centersDark, radiiDark,'LineStyle','--');
axis on, axis normal, hold on;
