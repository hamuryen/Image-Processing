function f = segment(g, segmentNumber)

    f = double(reshape(g, size(g, 1) * size(g, 2), size(g, 3)));
    idx = kmeans(f, segmentNumber);
    tmp = reshape(idx, size(g, 1), size(g, 2));
    f = uint8(tmp);

end
