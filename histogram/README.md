## Histogram Equalization

Histogram equalization is a method in image processing of contrast adjustment using the image's histogram. This method usually increases the global contrast of many images, especially when the usable data of the image is represented by close contrast values. Through this adjustment, the intensities can be better distributed on the histogram. This allows for areas of lower local contrast to gain a higher contrast.

The algorithm is implemented in MATLAB and can be found in the `histogram_equalization.m` file. The script reads an image from the `images` folder, computes the histogram of the image, and performs histogram equalization. The results are displayed in a figure window.

In this example, we do not use the built-in MATLAB function `histeq` for histogram equalization. Instead, we implement the algorithm from scratch to understand the underlying principles.
