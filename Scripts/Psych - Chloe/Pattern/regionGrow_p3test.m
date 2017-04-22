%Franklin King - 0604-1762
function regionGrow_p3test(seed, l_t, u_t)
%regionGrow_p3test - Tests the regionGrow_p3 function
%
%Input:
%   seed - Seed position for regionGrow_p3
%   l_t  - Lower threshold for regionGrow_p3
%   u_t  - Upper threshold for regionGrow_p3
%
%--------------------------------------------------------------------------
[segmentedImage, overlayImage] = regionGrow_p3('ct_image.txt', seed, l_t, u_t);

imshow(segmentedImage);
title('Binary Image');
figure
imshow(overlayImage);
title('Superimposed Image');
