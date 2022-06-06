function [ Hm ] = Hm_RBG_image( img, Lmax, kmax )
%{
    Function: Calculate the multidimension and multiscale Higuchi dimension (Hm) for the image
    INPUT: 
        --- input ------------------------ information ------------------------ requirement ------ type/dimension ----
        |   img     |                    RGB image                          |                 |   integer / [n,m,3]  |
        |   Lmax    |  maximum scale of hipercube for the multiscale step   |   odd integer   |   integer / 1        |
        |   kmax    |    maximum number of subseries in Higuchi method      |                 |   integer / 1        |
        --------------------------------------------------------------------------------------------------------------
    OUTPUT:
        --- output --------------------------------------- information -------------------------- type/dimension-------------
        |            | Multidimensional and multiscale higuchi dimension for the   |                                        |
        |     Hm     | image under analysis, one value per sliding vector size     | real / [1,num_of_sliding_structures+1] |
        |            | and the average of those values                             |                                        |
        ---------------------------------------------------------------------------------------------------------------------

    Date: 10/10/2019
%}
    tic;
    Hm = 0;
    
    for x = 1:size(img,1)                               % for each image row
        Hm = Hm + Hm_row(img(x,:,:), Lmax, kmax);     % sum of Higuchi dimension on each value of sliding vector  
    end

    Hm = Hm /size(img, 1);                              % compute the average of HF on each value of sliding vector 

    toc;
end
