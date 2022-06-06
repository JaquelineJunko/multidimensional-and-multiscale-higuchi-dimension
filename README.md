# Hm: A multiscale and multidimensional approach to calculate the Higuchi Fractal Dimension
Multidimensional and Multiscale Higuchi dimension for the analysis of colorectal histological images

Paper: https://ieeexplore.ieee.org/abstract/document/9313575

Implementation of the paper above. It allows the computation of the higuchi fractal dimension for color images.

## Requirements
Verify that version 9.6 (R2019a) of the MATLAB Runtime is installed.   

If not, you can download it in https://www.mathworks.com/products/compiler/matlab-runtime.html


## Examples

You can compute the multidimensional and multiscale higuchi dimension for one single color image as shown in ```example.m``` or as:

``` matlab
higuchi_dimension = mmHD_RBG_image(image, Lmax, kmax); 
```

Or you can calculate the multidimensional and multiscale Higuchi Dimension for a dataset, as shown in ```example2.m```

# Higuchi Dimension
The Higuchi Dimension for grey scale images is available in:

Jesús Monge-Álvarez (2022). Higuchi and Katz fractal dimension measures (https://www.mathworks.com/matlabcentral/fileexchange/50290-higuchi-and-katz-fractal-dimension-measures), MATLAB Central File Exchange. Retrieved April 28, 2022.

It can be use by:

```matlab
HFD = Higuchi_FD(serie, Kmax) 
```
