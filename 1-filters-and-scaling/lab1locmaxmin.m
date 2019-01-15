function [Jmax,Jmin] = lab1locmaxmin(img)
   
    [row,col,ch] = size(img);
    A = zeros(size(img));
    B = zeros(size(img));
    k = 5;
    
    if(ch==3)
        img = rgb2gray(img);
    end
    
    Dimg = double(img);
    
    for i = k+1:1:row-k-1
        for j = k+1:1:col-k-1
            subIm = Dimg(i-k:i+k,j-k:j+k);
            value1 = max(subIm(:));
            value2 = min(subIm(:));
            A(i,j) = value1;
            B(i,j) = value2;
        end
    end
    
    Jmax = uint8(A);
    Jmin = uint8(B);
    
end