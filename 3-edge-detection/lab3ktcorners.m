function corners = lab3ktcorners(img)
   
    [row,col,ch] = size(img);
    k = 1;
    corners = [];

    if(ch==3)
        img = rgb2gray(img);
    end
    
    Dimg = double(img);

    threshold = 100;
    [Gx, Gy] = imgradientxy(Dimg);
    
    for i = k+1:1:row-k-1
        for j = k+1:1:col-k-1
            subImx = Gx(i-k:i+k,j-k:j+k);
            subImy = Gy(i-k:i+k,j-k:j+k);
            H = [sum(sum(subImx.*subImx)) sum(sum(subImx.*subImy)); sum(sum(subImx.*subImy)) sum(sum(subImy.*subImy))];
            eigs = eig(H);
            if(min(eigs)>threshold)
                corners = [corners; i j];
            end
        end
    end
    
    imshow(img);
    hold on
    plot(corners(:,2),corners(:,1),'b*');

end