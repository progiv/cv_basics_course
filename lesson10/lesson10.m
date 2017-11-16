subplot(2,3,1)
I = im2double(imread('venus-793043.jpg'));
imshow(I);title('Original')

subplot(2,3,2)
PSF = fspecial('motion', 50, 45);
MotionBlur = imfilter(I,PSF,'replicate');
imshow(MotionBlur);title('Motion Blurred Image')

subplot(2,3,3)
noise_var = .000001;
BlurredWithNoise = imnoise(MotionBlur, 'gaussian', 0, noise_var);
imshow(BlurredWithNoise);title('Add some noise')

subplot(2,3,4)
imshow(deconvwnr(BlurredWithNoise, PSF, 0)); title('Inverse filter')

subplot(2,3,5)
estimated_nsr = noise_var / var(I(:));
imshow(deconvwnr(BlurredWithNoise, PSF, estimated_nsr)); title('Wiener filtration')

subplot(2,3,6)
imshow(deconvlucy(BlurredWithNoise, PSF)); title('Lucy filtration')