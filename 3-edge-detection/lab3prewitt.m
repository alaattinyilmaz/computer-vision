function [XK,YK,GK,EK] = lab3prewitt(img)
   
    [row,col,ch] = size(img);
    X = zeros(size(img));
    Y = zeros(size(img));
    G = zeros(size(img));
    E = zeros(size(img));
    k = 1;
    
    if(ch==3)
        img = rgb2gray(img);
    end
    
    Dimg = double(img);
    
    xkernel = [-1 0 1;
               -1 0 1;
               -1 0 1];
           
    ykernel = [-1 -1 -1;
               0 0 0;
               1 1 1];
                     
    threshold = 100;
    
    for i = k+1:1:row-k-1
        for j = k+1:1:col-k-1
            subIm = Dimg(i-k:i+k,j-k:j+k);
            value1 = sum(sum(subIm.*xkernel));
            value2 = sum(sum(subIm.*ykernel));
            value3 = sqrt(value1^2+value2^2);
            
            X(i,j) = value1;
            Y(i,j) = value2;
            G(i,j) = value3;
            
            if(value3>threshold)  
                E(i,j) = value3;
            end
 
        end
    end
    
    XK = uint8(X);
    YK = uint8(Y);
    GK = uint8(G);
    EK = uint8(E);
    
end