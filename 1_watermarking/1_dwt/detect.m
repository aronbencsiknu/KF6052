function [result] = detect(image, watermark, alpha)
    image = image(:);
    watermark = watermark(:);

    phi = 0;
    mu = 0;
    lambda = 0;
    
    for index = 1:size(watermark)

        phi = phi + ((image(index)/std2(image))^2)*(1 - 1/((1 + alpha*watermark(index))^2));

        mu = mu + 0.5 * (1 - 1/((1+alpha*watermark(index))^2));

        lambda = lambda + 0.5 * ((1 - 1/((1+alpha*watermark(index))^2))^2);

    end
    phi = phi * 0.5;
    if phi > 4.75 * sqrt(lambda) + mu
        result = " found";
    else
        result = " NOT found";
    end
end

