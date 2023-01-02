clear all;

img = imread("watermark.tif"); % load watermarked image
load('watermark.mat');

dct = dct2(double(img));

% specify areas to check watermarks in
area1 = dct(1:64, 65:128);
area2 = dct(65:128, 65:128);
area3 = dct(65:128, 1:64);

alpha = 0.2; % watermark strength

% check if watermark is present
disp(strcat("Watermark 1",detect(area1,w1,alpha)));
disp(strcat("Watermark 2",detect(area2,w2,alpha)));
disp(strcat("Watermark 3",detect(area3,w3,alpha)));
