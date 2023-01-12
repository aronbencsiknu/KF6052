clear all;

img = imread("peppers.tif"); % load image without watermark
load('watermark.mat'); % load watermark

% discrete wavelet transforms
[a1,h1,v1,d1] = dwt2(img, "db2", "mode", "per");    % level 1
[a2,h2,v2,d2] = dwt2(a1, "db2", "mode", "per");     % level 2
[a3,h3,v3,d3] = dwt2(a2, "db2", "mode", "per");     % level 3

alpha = 0.2; % watermark strength

% embed watermarks
h3 = embed(h3,w1,alpha);
d3 = embed(d3,w2,alpha);
v3 = embed(v3,w3,alpha);

% inverse discrete wavelet transforms
dwt_inverse_L3 = idwt2(a3, h3, v3, d3, "db2", "mode", "per");               % level 2
dwt_inverse_L2 = idwt2(dwt_inverse_L3, h2, v2, d2, "db2", "mode", "per");   % level 1
dwt_inverse_L1 = idwt2(dwt_inverse_L2, h1, v1, d1, "db2", "mode", "per");   % spatial domain

dwt_inverse = uint8(dwt_inverse_L1); % convert values to 8bit unsigned integers

% manipulations
%dwt_inverse = circshift(dwt_inverse,[1,1]);
%filter_size = [3,3];
%ave_filter = fspecial('average',filter_size);
%dwt_inverse = imfilter(dwt_inverse, ave_filter);

imshow(dwt_inverse);
imwrite(dwt_inverse, "watermark.tif"); % save watermarked image