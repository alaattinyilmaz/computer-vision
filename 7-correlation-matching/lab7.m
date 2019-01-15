imgR = imread('S01L.png');
imgL = imread('S01R.png');

[row,col,ch] = size(imgR);
imgR = rgb2gray(imgR);
imgL = rgb2gray(imgL);

imgR = double(imgR);
imgL = double(imgL);

omega = 100;
k = 5;

imgL = padarray(imgL,[omega+k omega+k],'both');
imgR = padarray(imgR,[omega+k omega+k],'both');

dispar = zeros(size(imgL));

tic
    for i = k+1:1:row-k-1
        for j = k+1:1:col-k-1
            dist = [];
            subImL = imgL(i-k:i+k,j-k:j+k);
            for p = 0:1:omega
                subImR = imgR(i-k:i+k,j-k+p:j+k+p);
                SSD = sum(sum(subImL-subImR).^2);
                dist = [dist; j j+p SSD];
            end
            ind = find(dist(:,3) == min(dist(:,3)));
            ind = ind(1);
            d = dist(ind, 2) - dist(ind, 1);
            dispar(i,j) = d;
        end
    end
toc

imgL = uint8(imgL);
imgR = uint8(imgR);
imshow(stereoAnaglyph(imgL,imgR));
figure; imagesc(dispar); colormap jet; colorbar

