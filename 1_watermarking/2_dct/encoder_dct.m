clear all;

img = imread("peppers.tif"); % load image without watermark
load('watermark.mat'); % load watermark

dct = dct2(double(img)); % Discrete Cosine Transform

alpha = 0.2; % watermark strength

% specify areas to embed watermarks in
area1 = dct(1:64, 65:128);
area2 = dct(65:128, 65:128);
area3 = dct(65:128, 1:64);

% embed watermarks in specified areas
area1_w = embed(area1,w1,alpha);
area2_w = embed(area2,w2,alpha);
area3_w = embed(area3,w3,alpha);

% replace specified areas with the watermarked version
dct(1:64, 65:128) = area1_w;
dct(65:128, 65:128) = area2_w;
dct(65:128, 1:64) = area3_w;   

dct_inverse = idct2(dct); % inverse Discrete Cosine Transform
dct_inverse = uint8(dct_inverse); % convert values to 8bit unsigned integers

% manipulations
%dwt_inverse = circshift(dwt_inverse,[1,1]);
%filter_size = [3,3];
%ave_filter = fspecial('average',filter_size);
%dwt_inverse = imfilter(dwt_inverse, ave_filter);

imshow(dct_inverse);
imwrite(dct_inverse, "watermark.tif"); % save watermarked image