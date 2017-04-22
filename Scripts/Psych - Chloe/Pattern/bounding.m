function output = bounding(file)

in = 1;
    
X = imread(file);
Y = thresh_p1(X, 0,150);
[Ilabel num] = bwlabel(Y);
iprops = regionprops(Ilabel);
Ibox = [iprops.BoundingBox];
Ibox = reshape(Ibox, [4 num]);
% imshow(Y);
hold on

floor(Ibox(1,1))
floor(Ibox(2,1))
floor(Ibox(3,1))
floor(Ibox(4,1))

% imshow(Y(10:24,8:12))
%(2:2+4, 1: 1+3)
% for i = 10:16
% for x = 8:10
% temp = [temp, Y(x,i)];
% end
% end
% temp = temp'
% for i = 1:35
%     t = [t,temp(i)];
% end

output = {};
for i = 1:num
    range = [floor(Ibox(1,i)),ceil(Ibox(2,i)),(floor(Ibox(3,i)) ),(ceil(Ibox(4,i)))];
    rectangle('position', range, 'edgecolor', 'r');
    
    img = zeros(range(4)+2, range(3)+2);
    startx = [range(2)-1, range(1)-1];
    for k = 1:range(3)+2
        for m = 1:range(4)+2
            img(m,k) = Y(startx(1) + m - 1, startx(2) + k - 1);
        end
    end
    unv = unique(img);
    temp = unv == 0;
    area = ((range(3)+2)*(range(4)+2));
    parameter = (range(3)+2)*2 + (range(4)+2)*2;
    blackness = max(size(temp))/area;
    ratio = (range(4) +3)/(range(2) +3);
    holes = bweuler(img);
    invar = area/parameter^2;
%     output = [output; blackness, ratio, holes, invar];  
    
    if i == in
%         output = [output;img];
        random(img);
        break
    end
end

