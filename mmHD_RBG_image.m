function [ mmHD ] = mmHD_RBG_image( img, Lmax, kmax )
%{
    Function: Calculate the multidimension and multiscale Higuchi dimension (mmHD) for the image
    INPUT: 
        img [n,m,3]: RGB image 
        Lmax [odd integer]: maximum scale of hipercube for the multiscale step 
        kmax [integer]: maximum number of subseries in Higuchi method 
    OUTPUT:
        mmHD [integer]: a single value of multidimensional and multiscale Higuchi dimension for the image

    Date: 10/10/2019
%}
    tic;
    mmHD = 0;
    
    for x = 1:size(img,1)                               % for each image row
        mmHD = mmHD + DH_linha(img(x,:,:), Lmax, kmax); % compute Higuchi dimension on each row of the image 
    end
    
    mmHD = mmHD /size(img, 1);                          % compute the average of HF for each row

    toc;
end