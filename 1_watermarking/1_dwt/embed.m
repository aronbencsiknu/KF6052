function [result] = embed(image, watermark, alpha)
    img_dim = size(image,1);
    image = image(:); % convert matrix to array
    watermark = watermark(:); % convert matrix to array
    for index = 1:size(watermark)
        image(index) = image(index) + alpha * watermark(index) * image(index); % operation on corresponding image and watermark values
    end

    result = reshape(image,[img_dim,img_dim]); % convert array to matrix
end