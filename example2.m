save_dir = '\results.mat';

kmax = 8;
Lmax = 45;
L_i = 3 : 2: Lmax;
num_of_L_i = length(L_i);

samples_class_1 = 67
samples_class_2 = 84
samples_dataset = samples_class_1 + samples_class_2

results = zeros(samples_dataset,num_of_L_i+2);

% Class 1
dir_orig = 'path_to_dataset_class_1\';
for i = 1 : samples_class_1
    img = imread( strcat(dir_orig,'Class_1 (',num2str(i),').bmp') );   % open image
    
    results(i,1:num_of_L_i + 1) = mmHD_RBG_image( img, Lmax, kmax );
    results(i,num_of_L_i + 2) = 1;      % Label Class 1
    
    save(save_dir);
end


% Class 2
dir_orig= 'path_to_dataset_class_2\';
for i = 1 : samples_class_2
    img = imread( strcat(dir_orig,'Class_2 (',num2str(i),').bmp') );   % open image
    
    results(samples_class_1+i,1:num_of_L_i + 1) = mmHD_RBG_image( img, Lmax, kmax );
    results(samples_class_1+i,num_of_L_i + 2) = 2;  % Label Class 2
    
    save(save_dir);
end
