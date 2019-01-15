function [XK,YK] = lab2sobelfilt(img)
   
    [row,col,ch] = size(img);
    X = zeros(size(img));
    Y = zeros(size(img));
    k = 1;
    
    if(ch==3)
        img = rgb2gray(img);
    end
    
    Dimg = double(img);
    
    xkernel = [-1 0 1;
               -2 0 2;
               -1 0 1];
           
    ykernel = [1 2 1;
               0 0 0;
               -1 -2 -1];
                     
    for i = k+1:1:row-k-1
        for j = k+1:1:col-k-1
            subIm = Dimg(i-k:i+k,j-k:j+k);
            value1 = sum(sum(subIm.*xkernel));
            value2 = sum(sum(subIm.*ykernel));
            X(i,j) = value1;
            Y(i,j) = value2;
        end
    end
    
    XK = uint8(X);
    YK = uint8(Y);
    
end