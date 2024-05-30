function [pyr] = create_pyramid(img, level)

    pyr = cell(1, level);
    pyr{1} = im2double(img);

    for p = 2:level
        pyr{p} = impyramid(pyr{p - 1}, 'reduce');
    end

    for p = level - 1:-1:1
        osz = size(pyr{p + 1}) * 2 - 1;
        pyr{p} = pyr{p}(1:osz(1), 1:osz(2), :);
    end

    for p = 1:level - 1
        t = impyramid(pyr{p + 1}, 'expand');
        t = imresize(t, [size(pyr{p}, 1) size(pyr{p}, 2)]);
        pyr{p} = pyr{p} - t;
    end

end
