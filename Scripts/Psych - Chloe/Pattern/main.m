function [new] =  main

file = 'digits2.pgm';
output = bounding(file);

mainOut = [];
numLines = [];
for i = 1:length(output)
    if i ~= 11
        out = random(output{i});
        dist = [];
        max_len = 0;
        for x = 1:2:length(out)
            p1 = out(x,:);
            p2 = out(x +1,:);
            d = abs(p1 - p2);
            dist = [dist, norm(p1 - p2)];
        end
        
        for x = 1: length(dist)
            if ( dist(x) > max_len)
                max_len = dist(x);
            end
        end
        mainOut = [mainOut; max_len];
%         numLines = [numLines; length(out)];
    end
end

size(mainOut)
new = [];
lines = [];
for i = 1:6:60
    int = 0;
    l = 0;
    for x = i:i+5
        int = int + mainOut(x);
%         l = l + numLines(x);
    end
    new = [new, int/6];
%     lines = [lines, l/6];
end