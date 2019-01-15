function [H,T,R,edges,P,lines] = lab5calibprep(img)
   
    [row,col,ch] = size(img);
    X = zeros(size(img));
    k = 1;
    
    if(ch==3)
        img = rgb2gray(img);
    end
    
    edges = edge(img,'Canny',[0.1 0.4]);
    
    [H,T,R] = hough(edges,'RhoResolution',0.5,'Theta',-90:0.5:89);

    P = houghpeaks(H,500,'Threshold',0.1*max(H(:)));

    lines = houghlines(edges,T,R,P,'FillGap',50,'MinLength',15);

end