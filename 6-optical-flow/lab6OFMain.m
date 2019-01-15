clear all; close all; clc;
load('sphere.mat');
Seq = sphere;
% Load the files given in SUcourse as Seq variable
[row,col,num]=size(Seq);
% Define k and Threshold
k = 10;
Threshold = 5000;
for j=2:1:num
ImPrev = Seq(:,:,j-1)
ImCurr = Seq(:,:,j)
lab6OF(ImPrev,ImCurr,k,Threshold);
pause(0.1);
end