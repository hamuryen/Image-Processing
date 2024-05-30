function [img] = combine_pyramid(pyr)

    for p = length(pyr) - 1:-1:1
        lap = impyramid(pyr{p + 1}, 'expand')
        t = impyramid(pyr{p + 1}, 'expand');
        t = imresize(t, [size(pyr{p}, 1) size(pyr{p}, 2)]);
        pyr{p} = pyr{p} + t;
    end

    img = pyr{1};

end
