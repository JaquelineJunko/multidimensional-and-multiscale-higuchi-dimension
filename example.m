diretorioDestino='C:\Users\jaque\Google Drive\IC\Implementa��o\Higuchi\Base 1\Base 1\results.mat';
results = zeros(151,24);
Lmax=45;
kmax = 8;

% Benigno
diretorioOrigem= 'C:\Users\jaque\Google Drive\IC\Implementa��o\Higuchi\Base 1\Base 1\Benigno\';
for i = 1 : 67
    img = imread( strcat(diretorioOrigem,'Benigno (',num2str(i),').bmp') ); %abrir imagem
    
    results(i,1:23) = mmHD_RBG_image( img, Lmax, kmax );
    results(i,24) = 1;
    
    save(diretorioDestino);
end


%Maligno
diretorioOrigem= 'C:\Users\jaque\Google Drive\IC\Implementa��o\Higuchi\Base 1\Base 1\Maligno\';
for i = 1 : 84
    img = imread( strcat(diretorioOrigem,'Maligno (',num2str(i),').bmp') ); %abrir imagem
    
    results(67+i,1:23) = mmHD_RBG_image( img, Lmax, kmax );
    results(67+i,24) = 2;
    
    save(diretorioDestino);
end
