function [J] = lab1locbox(img)
   
    [row,col,ch] = size(img);
    A = zeros(size(img));
    k = 5;
    
    if(ch==3)
        img = rgb2gray(img);
    end
    
    Dimg = double(img);
    
    for i = k+1:1:row-k-1
        for j = k+1:1:col-k-1
            subIm = Dimg(i-k:i+k,j-k:j+k);
            value = mean(subIm(:));     
            A(i,j) = value;
        end
    end
    
    J = uint8(A);
    
end