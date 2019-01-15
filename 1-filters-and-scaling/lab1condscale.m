function [J] = lab1condscale(img1,img2)

    [row1,col1,ch1] = size(img1);
    [row2,col2,ch2] = size(img2);
    
    if(ch1==3)
        img1 = rgb2gray(img1);
    end
    
    if(ch2==3)
        img2 = rgb2gray(img2);
    end
    
    Dimg1 = double(img1);
    Dimg2 = double(img2);
  
    mean1 = mean(Dimg1(:));
    mean2 = mean(Dimg2(:));
    
    std1 = std(Dimg1(:));
    std2 = std(Dimg2(:));
    
    a = mean1*(std2/std1)-mean2;
    b = std1/std2;
    K = b.*(Dimg2+a);
    J = uint8(K);
end