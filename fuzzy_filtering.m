ori_img = imread('lena_color_512.tif');
gauss_img = imnoise(ori_img,'gaussian',0,0.005);
poisson_img = imnoise(ori_img,'poisson');
snp_img = imnoise(ori_img,'salt & pepper', 0.02);
spec_img = imnoise(ori_img,'speckle', 0.04);

L1 = NAFSM(gauss_img);
L2 = NAFSM(poisson_img);
L3 = NAFSM(snp_img);
L4 = NAFSM(spec_img);

imshow(L1);title('Effect of Adaptive fuzzy switching median filter on gaussian noise');
figure;
imshow(L2);title('Effect of Adaptive fuzzy switching median filter on poisson noise');
figure;
imshow(L3);title('Effect of Adaptive fuzzy switching median filter on salt and pepper noise');
figure;
imshow(L4);title('Effect of Adaptive fuzzy switching median filter on salt and speckle noise');

peaksnr1 = psnr(ori_img,L1);
fprintf('\n The Peak-SNR value on Gaussian noise is %0.4f', peaksnr1);
peaksnr2 = psnr(ori_img,L2);
fprintf('\n The Peak-SNR value on Poisson noise is %0.4f', peaksnr2);
peaksnr3 = psnr(ori_img, L3);
fprintf('\n The Peak-SNR value on Salt & Pepper noise is %0.4f', peaksnr3);
peaksnr4 = psnr(ori_img,L4);
fprintf('\n The Peak-SNR value on Speckle noise is %0.4f', peaksnr4);