function newImage = thresh_p1(image, l_t, u_t)
%thresh_p1 - Generates a segmented binary image using universal threshold
%            bounds
%
%Input:
%   image - 
%   l_t       - Lower threshold. Specify lower bound on threshold 
%   u_t       - Upper threshold. Specify upper bound on threshold
%
%--------------------------------------------------------------------------
newImage = zeros(size(image, 1), size(image, 2));

%All values that fall within the threshold bounds are set to 1; all that do
%not fall within the bounds are set to 0
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        if image(i, j) < l_t || image(i, j) > u_t
            newImage(i, j) = 0;
        else
            newImage(i, j) = 1;
        end
    end  
end

%Make a new file with the binary image
%csvwrite(['segmented_' imageName], newImage);

