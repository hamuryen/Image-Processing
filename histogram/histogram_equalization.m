function f_histeq = histogram_equalization(f)
    % Initialize the output image with the same size as the input
    f_histeq = f;
    [a, b, c] = size(f);

    % Process each color channel separately for color images
    for it = 1:c
        f_histeq(:, :, it) = channel_histeq(f_histeq(:, :, it));
    end

end

function g = channel_histeq(f)
    % Convert the input image to double for processing
    g = double(f);
    [m, n] = size(g);
    len = m * n;

    % Reshape the image matrix into a single column vector
    x = reshape(g, len, 1);
    L = 256; % Number of intensity levels

    % Compute the histogram of the input image
    xpdf = hist(x, [0:L - 1]);
    xpdf = xpdf / len; % Normalize to get the PDF

    % Compute the CDF from the PDF
    sk = xpdf * triu(ones(L));

    % Initialize the output image
    y0 = zeros(m, n);

    % Apply the transformation based on the CDF
    for k = 0:L - 1

        if (xpdf(k + 1) > 0)
            list = find(g == k);
            y0(list) = sk(k + 1) * (L - 1);
        end

    end

    % Convert the output image back to uint8 format
    g = uint8(y0);
end
