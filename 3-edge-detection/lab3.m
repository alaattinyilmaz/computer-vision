img = imread('chessboard.jpg');

    [row,col,ch] = size(img);  
    if(ch==3)
        img = rgb2gray(img);
    end

%[sobelx,sobely,sobelg,sobele] = lab3sobel(img);
%[prewittx,prewitty,prewittg,prewitte] = lab3prewitt(img);
%logfiltered = lab3log(img);
%plot(filteredimg(3,1:1:316));

corners = lab3ktcorners(img);