clc;
input_image = imread('images/inputs/1.png'); % Read the input image
output_image = histogram_equalization(input_image); % Perform histogram equalization

% Display the original and equalized images side by side
subplot(1, 2, 1), imshow(input_image), title('Original Image');
subplot(1, 2, 2), imshow(output_image), title('Histogram Equalized Image');
