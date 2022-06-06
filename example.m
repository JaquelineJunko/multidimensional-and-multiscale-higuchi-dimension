dir_save='\results.mat';

kmax = 8;
Lmax = 45;
L_i = 3 : 2: Lmax;
num_of_L_i = length(L_i);

results = zeros(1,num_of_L_i+1);

path_image = 'path_to_image';
img = imread(path_image);   % open image

results(1,1:num_of_L_i+1) = Hm_RBG_image( img, Lmax, kmax );  % compute multidimensional and multiscale higuchi dimension

save(dir_save);             % save results