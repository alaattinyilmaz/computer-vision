function G = lab2sharpen(img,M,lambda)
   
    if (M==1)
        Simg = lab1locbox(img);
    end
    if (M==2)
        Simg = lab2gaussfilt(img);
    end
    if (M==3)
        Simg = lab2medfilt(img);
    end
    
    [row,col,ch] = size(img);
    A = zeros(size(img));
    k = 2;
    
    if(ch==3)
        img = rgb2gray(img);
    end
    
    Simg = double(Simg);
    Dimg = double(img);
    
    K = Dimg+lambda.*(Dimg-Simg);
    G = uint8(K);
    
end