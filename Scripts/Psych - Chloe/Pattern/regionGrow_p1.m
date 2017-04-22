%Franklin King - 0604-1762
function regionGrow_p1(imageName, position, value)
%regionGrow_p1 - Shows an image specified by the function with a marker positioned on a specific location 
%
%Input:
%   imageName - Name of the image. Example: 'ct_image.txt'
%   position  - Location to place the marker
%   value     - Set new intensity of pixel on marker position
%
%--------------------------------------------------------------------------
image = dlmread(imageName);
image = normalizeImage(image);

%Change pixel to value from 0 to 1 (or greater)
image(position(2), position(1)) = value;

imshow(image);
hold

%Additionally place a red cross on the point
plot(position(1), position(2), 'xr');

hold

title(['Position at ' '[' num2str(position(1)) ', ' num2str(position(2)) ']' ]);
