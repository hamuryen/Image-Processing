clc
clear
close all

img_a = im2double(imread('images/inputs/focal11.png'));
img_b = im2double(imread('images/inputs/focal12.png'));
img_a = imresize(img_a, [size(img_b, 1) size(img_b, 2)]);
level = 5;

pyr1 = create_pyramid(img_a, level);
pyr2 = create_pyramid(img_b, level);
pyr_img = applay_mask(pyr1, pyr2, img_a, level);
img_img = combine_pyramid(pyr_img);

subplot(1, 3, 1), imshow(img_a);
title('1. Original Image');
subplot(1, 3, 2), imshow(img_b);
title('2. Original Image');
subplot(1, 3, 3), imshow(img_img);
title('Enhanced Image');
