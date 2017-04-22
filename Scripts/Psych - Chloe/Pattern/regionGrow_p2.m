%Franklin King - 0604-1762
function neighbours = regionGrow_p2(image, position)
%regionGrow_p2 - Outputs the up to 4 neighbours of a specified pixel
%
%Input:
%   image     - Matrix representing an image
%   position  - Position of pixel
%
%Output:
%   neighbours - A 2xN matrix where each row represents a neighbouring
%                pixel
%
%--------------------------------------------------------------------------
%Neighbours is set to different values depending on where in the image it
%is. Pixels on a border result in fewer neighbours.
if position(1) == 1
    if position(2) == 1
        neighbours = [position(1)+1, position(2); position(1), position(2)+1];
    elseif position(2) == size(image, 2)
        neighbours = [position(1)+1, position(2); position(1), position(2)-1];
    else
        neighbours = [position(1)+1, position(2); position(1), position(2)+1; position(1), position(2)-1];
    end
elseif position(1) == size(image, 1)
    if position(2) == 1
        neighbours = [position(1)-1, position(2); position(1), position(2)+1];
    elseif position(2) == size(image, 2)
        neighbours = [position(1)-1, position(2); position(1), position(2)-1];
    else
        neighbours = [position(1)-1, position(2); position(1), position(2)+1; position(1), position(2)-1];
    end
else
    if position(2) == 1
        neighbours = [position(1)-1, position(2); position(1), position(2)+1; position(1)+1, position(2)];
    elseif position(2) == size(image, 2)
        neighbours = [position(1)-1, position(2); position(1), position(2)-1; position(1)+1, position(2)];
    else
        neighbours = [position(1)-1, position(2); position(1)+1, position(2); position(1), position(2)-1; position(1), position(2)+1];
    end
end


