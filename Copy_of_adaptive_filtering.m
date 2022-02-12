ori_img = imread('lena_color_512.tif');
spec_img = imnoise(ori_img,'speckle', 0.04);
tt = imshow(im2bw(spec_img));
saveas(tt,'C:\Users\mail2\OneDrive\Documents\MATLAB\UIT Project\Image Noise Removals\57480\Image Data Set\lenaspecklebw.jpg') ;