%Franklin King - 0604-1762
function normalizedImage = normalizeImage(image)
%normalizeImage - Normalizes a matrix representing an image (converted so 
%                 values are all 0 to 1)
%
%Input:
%   image - Matrix representing an image
%
%Output:
%   normalizedImage - Normalized matrix representing an image with all
%                     pixel intensities now in the range of 0 to 1
%
%--------------------------------------------------------------------------
normalizedImage = zeros(size(image, 1), size(image, 2));
maximum = max(max(image));

for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        normalizedImage(i, j) = image(i, j) / maximum;
    end
end
