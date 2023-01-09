function vector=get_featureVector(image)
% this function returns a column vector of 49 DCT features.
[m,n,k]=size(image);
if k>1,
    image=rgb2gray(image);   % only the greyscale image is used.
end

transformed_image=dct2(image);
min_dimension=min([m n]);
Z = zigzag4(min_dimension); % the DCT-trandformed image is converted into one-dimensional array in a zigzag order.

vector=[]; % initialisation with empty vector
for i=2:50, % use 256 coefficients of the DCT-transformed image in ZigZag order.
    vector=[vector;transformed_image(Z(i,1),Z(i,2))];
end
 