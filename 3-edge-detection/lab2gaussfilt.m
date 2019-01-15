function G = lab2gaussfilt(img)
   
    [row,col,ch] = size(img);
    A = zeros(size(img));
    k = 2;
    
    if(ch==3)
        img = rgb2gray(img);
    end
    
    Dimg = double(img);
    
    gaussWindow = 1/273*[1 4 7 4 1;
                         4 16 26 16 4;
                         7 26 41 26 7;
                         4 16 26 16 4;
                         1 4 7 4 1];
                     
    for i = k+1:1:row-k-1
        for j = k+1:1:col-k-1
            subIm = Dimg(i-k:i+k,j-k:j+k);
            value = sum(sum(subIm.*gaussWindow));
            A(i,j) = value;
        end
    end
    
    G = uint8(A);
    
end