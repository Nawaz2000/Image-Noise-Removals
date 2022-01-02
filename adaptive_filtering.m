ori_img = imread('cameraman.tif');
gauss_img = imnoise(ori_img,'gaussian',0,0.005);
poisson_img = imnoise(ori_img,'poisson');
snp_img = imnoise(ori_img,'salt & pepper', 0.02);
spec_img = imnoise(ori_img,'speckle', 0.04);

L1 = wiener2(gauss_img,[5,5]);
L2 = wiener2(poisson_img,[5,5]);
L3 = wiener2(snp_img,[5,5]);
L4 = wiener2(spec_img,[5,5]);

imshowpair(gauss_img, L1, 'montage');title('Effect of wiener filter on gaussian noise');
figure;
imshowpair(poisson_img, L2, 'montage');title('Effect of wiener filter on poisson noise');
figure;
imshowpair(snp_img, L3, 'montage');title('Effect of wiener filter on salt and pepper noise');
figure;
imshowpair(spec_img, L4, 'montage');title('Effect of wiener filter on salt and speckle noise');

peaksnr1 = psnr(ori_img,gauss_img);
fprintf('\n The Peak-SNR value on Gaussian noise is %0.4f', peaksnr1);
peaksnr2 = psnr(ori_img,poisson_img);
fprintf('\n The Peak-SNR value on Poisson noise is %0.4f', peaksnr2);
peaksnr3 = psnr(ori_img,snp_img);
fprintf('\n The Peak-SNR value on Salt & Pepper noise is %0.4f', peaksnr3);
peaksnr4 = psnr(ori_img,spec_img);
fprintf('\n The Peak-SNR value on Speckle noise is %0.4f', peaksnr4);