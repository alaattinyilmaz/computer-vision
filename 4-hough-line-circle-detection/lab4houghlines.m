function [H,T,R,edges,P,lines] = lab4houghlines(img)
   
    [row,col,ch] = size(img);
    X = zeros(size(img));
    k = 1;
    
    if(ch==3)
        img = rgb2gray(img);
    end
    
    edges = edge(img,'canny');
    
    tic;
    [H,T,R] = hough(edges,'RhoResolution',0.5,'Theta',-90:0.5:89);
    toc;
    
    % P  = houghpeaks(H,20);
    tic;
    P = houghpeaks(H,20,'Threshold',0.5*max(H(:)));
    toc;
    
    tic;
    lines = houghlines(edges,T,R,P,'FillGap',10,'MinLength',40);
    toc;
end