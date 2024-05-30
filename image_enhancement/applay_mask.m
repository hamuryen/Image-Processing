function [result] = applay_mask(pyr1, pyr2, img, level)
    v = 180;
    maska = zeros(size(img));
    maska(1:v, :, :) = 1;
    maskb = 1 - maska;
    result = cell(1, level);

    for p = 1:level
        [Mp Np ~] = size(pyr1{p});
        maskap = imresize(maska, [Mp Np]);
        maskbp = imresize(maskb, [Mp Np]);
        result{p} = pyr1{p} .* maskap + pyr2{p} .* maskbp;
    end

end
