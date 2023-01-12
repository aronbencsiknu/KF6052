clear all;
clc;

img = imread("watermark.tif"); % load watermarked image
load('watermark.mat'); % load watermark

% discrete wavelet transforms
[a1,h1,v1,d1] = dwt2(img, "db2", "mode", "per");    % level 1
[a2,h2,v2,d2] = dwt2(a1, "db2", "mode", "per");     % level 2
[a3,h3,v3,d3] = dwt2(a2, "db2", "mode", "per");     % level 3

alpha = 0.2; % watermark strength

% check if watermark is present
disp(strcat("Watermark 1",detect(h3,w1,alpha)));
disp(strcat("Watermark 2",detect(d3,w2,alpha)));
disp(strcat("Watermark 3",detect(v3,w3,alpha)));
