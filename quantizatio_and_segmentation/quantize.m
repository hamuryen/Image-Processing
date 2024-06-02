function [f, map] = quantize(g, method, k)

    f = g;
    [x, y, z] = size(g);

    if method == 'uniform'

        if z == 3
            [f, map] = rgb2ind(g, k, 'nodither');
        elseif z == 1
            [f, map] = gray2ind(g, k, 'nodither');
        end

    elseif method == 'k-means'

        map = 0;

        if z == 3
            r = g(:, :, 1);
            g_ = g(:, :, 2);
            b = g(:, :, 3);
            image_k_mean(:, 1) = r(:);
            image_k_mean(:, 2) = g_(:);
            image_k_mean(:, 3) = b(:);
            image_k_mean = double(image_k_mean);
            [indx, c] = kmeans(image_k_mean, k, 'EmptyAction', 'singleton');
            s = size(g);
            indx = uint8(indx);
            c2 = round(c);
            f = zeros(s(1), s(2), 3);
            temp = reshape(indx, [s(1) s(2)]);

            for i = 1:1:s(1)

                for j = 1:1:s(2)
                    f(i, j, :) = c2(temp(i, j), :);
                end

            end

            f = uint8(f);

        elseif z == 1
            gry = g(:, :, 1);
            image_k_mean(:, 1) = gry(:);
            image_k_mean = double(image_k_mean);
            [indx, c] = kmeans(image_k_mean, k, 'EmptyAction', 'singleton');
            s = size(g);
            indx = uint8(indx);
            c2 = round(c);
            f = zeros(s(1), s(2), 3);
            temp = reshape(indx, [s(1) s(2)]);

            for i = 1:1:s(1)

                for j = 1:1:s(2)
                    f(i, j, :) = c2(temp(i, j), :);
                end

            end

            f = uint8(f);
        end

    end

end
