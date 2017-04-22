%Franklin King - 0604-1762
function [segmented, image] = regionGrow_p3(imageName, seed, l_t, u_t)
%regionGrow_p3 - Takes an image filename, seed and lower and upper bounds
%                and generates both a segmented and superimposed image 
%                using an iterative region growing algorithm
%
%Input:
%   imageName - Name of the image. Example: 'ct_image.txt'
%   seed      - Position of seed, the initial pixel from which to start the
%               region growing algorithm
%   l_t       - Lower threshold. Specify lower bound on threshold 
%   u_t       - Upper threshold. Specify upper bound on threshold
%
%Output:
%   segmented - Matrix representing a binary image resulting from the
%               segmentation
%   image     - Matrix reprsenting the binary image superimposed on the
%               original image
%
%--------------------------------------------------------------------------
image = imread(imageName);

%Create a matrix of the same size of the original image. All values start
%with zero representing black space.
segmented = zeros(size(image, 2), size(image, 1));

%Normalize both the image and the thresholds
l_t = l_t / max(max(image));
u_t = u_t / max(max(image));
image = normalizeImage(image);

%Set value of the initial seed position. If it is out of bounds the
%function will immediately terminate.
if (image(seed(2), seed(1)) >= l_t) && (image(seed(2), seed(1)) <= u_t)
    image(seed(2), seed(1)) = 1;
    segmented(seed(2), seed(1)) = 1;
else
    return;
end

%Add initial neighbours of the seed point using regionGrow_p2
neighbours = regionGrow_p2(image, seed);

%Repeat until no more valid neighbours are found
%Neighbours stores all pixels that need to be looked at
while ~isempty(neighbours)
    invalidNeighbours = [];
    
    %Marks which pixels in neighbours are either out of bounds or already
    %looked at
    for i = 1:size(neighbours, 1)
        if ((image(neighbours(i, 2), neighbours(i, 1)) < l_t) || (image(neighbours(i, 2), neighbours(i, 1)) > u_t)) ...
                || (segmented(neighbours(i, 2), neighbours(i, 1)) == 1)
            invalidNeighbours = [i, invalidNeighbours];
        end
    end
    
    %Remove marked pixels in neighbours
    for i = 1:size(invalidNeighbours, 2)
        neighbours(invalidNeighbours(i), :) = [];
    end
    
    %If any pixel in neighbours falls within the bounds, its value is
    %changed to 1 which represents the highest possible intensity now that
    %the image is normalized. Also change the corresponding value in what
    %was initially the zeros matrix segmented in order to simaltaneously 
    %generate a binary image.
    for i = 1:size(neighbours, 1)
        if ((image(neighbours(i, 2), neighbours(i, 1)) >= l_t) && (image(neighbours(i, 2), neighbours(i, 1)) <= u_t))
            image(neighbours(i, 2), neighbours(i, 1)) = 1;
            segmented(neighbours(i, 2), neighbours(i, 1)) = 1;
        end
    end
    
    %Add the neighbours of each of the pixels that were looked at.
    for i = 1:size(neighbours, 1)
        neighbours = [neighbours; regionGrow_p2(image, neighbours(i, :))];
    end
    
    %Remove duplicate pixels. Each row is a pixel.
    neighbours = unique(neighbours, 'rows');
end

