function [J] = lab1linscale(img)
    Dimg = double(img);
    [row,col,ch] = size(img);
    if(ch==3)
        doubleImg = rgb2gray(img);
    end
    umin = min(Dimg(:));
    umax = max(Dimg(:));
    Gmax = 255;
    a = -umin;
    b = Gmax/(umax-umin);
    K = b.*(Dimg+a);
    J = uint8(K);
end