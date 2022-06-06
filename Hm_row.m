function [ HD_line ] = Hm_row( data1D, Lmax, kmax)
%{
    Function that perform the gliding box on the image row with the sliding structures (named also as vector or box). 
    For each box lenght L, a series (newSerie) is created. It contains the pixels with the highest 
    RGB value, for those pixels that satisfy the Minkowski distance max|F - Fc| <= L.

    INPUT:
        --- input ------------------------ information ------------------------ requirement ----- type/dimension ---
        |  data1D   | a serie (row) from the image                          |                 |   integer / [1,n]  |
        |   Lmax    | maximum value for the length of the sliding structure |   odd integer   |   integer / 1      |
        |   kmax    | number of subseries created by Higuchi Dimension      |                 |   integer / 1      |
        ------------------------------------------------------------------------------------------------------------
    OUTPUT:
        --- output --------------------------------------- information -------------------------- type/dimension-------------
        |            | Multidimensional and multiscale higuchi dimension for the   |                                        |
        |  HD_line   | 1D serie under analysis, one value per sliding vector size, | real / [1,num_of_sliding_structures+1] |
        |            | and the average of those values                             |                                        |
        ---------------------------------------------------------------------------------------------------------------------
    
        Date: 15/08/2019
%}

    serie = double( data1D );
    L = 3 : 2 : Lmax;           % glidingbox vector sizes

    HD_partial = zeros(1,length(L));
    total_created_series = 0;

    for k = 1 : size(L, 2)      % For each vector/box lenght 
        lim = (L(k)/2) - 0.5;   % How many pixels between the first pixel and the central pixel of the serie

        auxData = zeros(1, length(data1D));         % Store the pixels that belong to the Minkowski distance - 0: if do not belong; other value: otherwise

        for y = lim + 1 : size(data1D, 2) - lim     % Analyzes the central pixels in the serie under analysis (data1D) [y = CENTRAL PIXEL]

            yi = y - lim;       % pixel at the beginning of the box
            yf = y + lim;       % pixel at the end of the box

            for j = yi : yf     % Runs through the structure/box [j = BOX PIXELS]

                cont = j;       % auxData index. Index of the pixel that will be compared to the central pixel

                if(j ~= y)      % Does not compare the central pixel with itself         
                    % Minkowski distance: |F - Fc| = max(|f_i - fc_i|)  ->  F_c = fc(x_c, y_c, r_c, g_c, b_c): central pixel; F = f(x,y,r,g,b): other pixels in the vector
                    
                    dist = abs(serie(1,j,1) - serie(1,y,1));        % distance in R channel : |box pixel in R channel - central pixel in R channel|

                    if(dist <= L(k))
                        rgb(1) = serie(1,j,1);
                        dist = abs(serie(1,j,2)-serie(1,y,2));      % distance in G channel

                        if(dist <= L(k))
                            rgb(2) = serie(1,j,2);
                            dist = abs(serie(1,j,3)-serie(1,y,3));  % distance in B channel

                            if(dist <= L(k))                    % the current pixel that satisfy the Minkowski distance
                                rgb(3) = serie(1,j,3);             
                                auxData(1, cont) = max(rgb);    % get the higher pixel value in the RGB channel
                            end
                        end
                    end
                end

            end         % Loop to run through the box 
        end             % Loop to run through the central pixel 

        newSerie = zeros(1,size(find(auxData),2)); 
        cont = 1;

        % create the auxiliary serie with the eligible pixels (those that satisfy the MK distance and have the highest RGB pixel as value)
        for x = 1 : length(data1D)  
            if (auxData(1,x) ~= 0)                  % when the i-th position of auxData is equal to: [1-255] - the pixel (of the input serie in this position) satisfies the MK distance; 0 - otherwise  
                newSerie(1, cont) = auxData(1,x);
                cont = cont+1;
            end
        end

        % calculate the Higuchi Dimension of each box vector lenght, based on the new series created
        if (length(newSerie) > 1)
            HD_partial(1,k) = Higuchi_FD(newSerie, kmax);
            total_created_series = total_created_series + 1;    % number of new auxiliary series created
        end

    end             % Loop for each vector lenght

    HD_line = HD_partial; % return the Higuchi dimension on each lenght L

    HD_line(1,end+1) = sum(HD_partial)/total_created_series;     % Compute the Higuchi dimension for the row. (Average Higuchi dimension of each vector of size L)
end
