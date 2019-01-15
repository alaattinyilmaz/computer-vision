function lab6OF(ImPrev,ImCurr,k,Threshold)
% Smooth the input images using a Box filter or Gaussian Filter
boxfilter = ones(5,5);

gaussfilter = 1/273 *   [1 4 7 4 1;
                         4 16 26 16 4;
                         7 26 41 26 7;
                         4 16 26 16 4;
                         1 4 7 4 1];
                     
ImCurr = conv2(ImCurr, boxfilter);
ImPrev = conv2(ImPrev, boxfilter);  

% Calculate spatial gradients (Ix, Iy) using Prewitt filter
 prewitt_xkernel = [-1 0 1;
                    -1 0 1;
                    -1 0 1];

 prewitt_ykernel = [-1 -1 -1;
                     0 0 0;
                     1 1 1];

 IxG = conv2(ImCurr, prewitt_xkernel);
 IyG = conv2(ImCurr, prewitt_ykernel);

% Calculate temporal (It) gradient
 ItG = ImPrev - ImCurr;

[ydim,xdim] = size(ImCurr);
Vx = zeros(ydim,xdim);
Vy = zeros(ydim,xdim);
G = zeros(2,2);
b = zeros(2,1);
cx=k+1;
for x=k+1:k:xdim-k-1
cy=k+1;
for y=k+1:k:ydim-k-1
% Calculate the elements of G and b
 Ix = IxG(y-k:y+k,x-k:x+k);
 Iy = IyG(y-k:y+k,x-k:x+k);
 It = ItG(y-k:y+k,x-k:x+k);
 
 G11 = sum(sum(Ix.*Ix));
 G12 = sum(sum(Ix.*Iy));
 G21 = G12;
 G22 = sum(sum(Iy.*Iy));

 G = [G11 G12; G21 G22];
 b1 = sum(sum(Ix.*It));
 b2 = sum(sum(Iy.*It));
 b = [b1; b2];

if (min(eigs(G)) < Threshold)
Vx(cy,cx)=0;
Vy(cy,cx)=0;
else
% Calculate u
u = -inv(G)*b;
Vx(cy,cx)=u(1);
Vy(cy,cx)=u(2);
end
cy=cy+k;
end
cx=cx+k;
end
cla reset;
imagesc(ImPrev); hold on;
[xramp,yramp] = meshgrid(1:1:xdim,1:1:ydim);
quiver(xramp,yramp,Vx,Vy,10,'r');
colormap gray;
end