function [centersBright, radiiBright, centersDark, radiiDark] = lab4houghlines(img,Rmin,Rmax,Sensitivity)
   
    [row,col,ch] = size(img);    
    if(ch==3)
        img = rgb2gray(img);
    end
    tic;
    [centersBright, radiiBright] = imfindcircles(img,[Rmin Rmax],'ObjectPolarity','bright','Sensitivity',Sensitivity);
    [centersDark, radiiDark] = imfindcircles(img,[Rmin Rmax],'ObjectPolarity','dark','Sensitivity',Sensitivity);
    toc;
end