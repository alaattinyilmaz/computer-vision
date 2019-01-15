function XK= lab3log(img)
   
    [row,col,ch] = size(img);
    X = zeros(size(img));
    k = 1;
    
    % Gaussian Filter Applied
    img = lab2gaussfilt(img);
    
    if(ch==3)
        img = rgb2gray(img);
    end
    
    Dimg = double(img);
    
    xkernel = [0 1 0;
               1 -4 1;
               0 1 0];
           
    for i = k+1:1:row-k-1
        for j = k+1:1:col-k-1
            subIm = Dimg(i-k:i+k,j-k:j+k);
            value1 = sum(sum(subIm.*xkernel));
            X(i,j) = value1;
        end
    end
    
    XK = double(X);
    
end