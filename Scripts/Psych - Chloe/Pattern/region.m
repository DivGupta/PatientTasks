function region( image, threshold, connections, filename )

% timage = thresh_p1(image,0,threshold);

% imshow(timage);
timage = imread(image);
CC = bwconncomp(timage, connections);
labels = labelmatrix(CC);

colors = distinguishable_colors(100,[0,0,0]);
colors(1,:) = [0,0,0];

RGB = ind2rgb(labels,colors);
figure;
% imshow(RGB);
hold on;

output = zeros(1,5);

properties = {'Area', 'BoundingBox', 'Perimeter', 'EulerNumber', 'Centroid'};
propresult = regionprops(labels,properties);

mDist = 0;
mDistNew = 0;
centroid = [0,0];
mDistPoint = [0,0];

centroidArea = 0;
circumArea = 0;

%Aspect Ratio, Holes, Area/Perimeter^2, Pixel Ratio (box), Pixel Ratio (circle

for n = 1:size(propresult,1)
%for n = 1:61
    if (propresult(n).Area > 5)
        disp('Region: ');
        disp(n);
 
        disp('Aspect Ratio: ');
        maxX = propresult(n).BoundingBox(1)+propresult(n).BoundingBox(3);
        minX = propresult(n).BoundingBox(1);
        maxY = propresult(n).BoundingBox(2)+propresult(n).BoundingBox(4);
        minY = propresult(n).BoundingBox(2);
        disp(((maxX - minX + 1) / (maxY - minY + 1)));
        output(n,1) = ((maxX - minX + 1) / (maxY - minY + 1));
        line([minX,minX],[minY,maxY],'Color','white','LineWidth',1);
        line([maxX,maxX],[minY,maxY],'Color','white','LineWidth',1);
        line([minX,maxX],[minY,minY],'Color','white','LineWidth',1);
        line([minX,maxX],[maxY,maxY],'Color','white','LineWidth',1);

        disp('Holes: ');
        disp(((propresult(n).EulerNumber * (-1)) + 1));
        output(n,2) = ((propresult(n).EulerNumber * (-1)) + 1);

        disp('Area/(Perimeter^2): ');
        disp((propresult(n).Area) / (propresult(n).Perimeter^2));
        output(n,3) = (propresult(n).Area) / (propresult(n).Perimeter^2);

        disp('Blackness Ratio (bounding box): ');
        disp(propresult(n).Area / ((maxX-minX)*(maxY-minY)));
        output(n,4) = propresult(n).Area / ((maxX-minX)*(maxY-minY));         
        
        disp('Blackness Ratio (Centroid centre circle): ');
        maxX = floor(maxX);
        maxY = floor(maxY);
        minX = ceil(minX);
        minY = ceil(minY);
        
        plot(propresult(n).Centroid(1),propresult(n).Centroid(2),'*','Color','green')
        
        for x = minX:maxX
            if (timage(minY,x) == 1)
                mDistNew = pdist([propresult(n).Centroid(1),propresult(n).Centroid(2);x,minY],'euclidean');
                if (mDistNew >= mDist)
                   mDist = mDistNew;
                   mDistPoint = [x,minY-0.5];
                end
            end
            
            if (timage(maxY,x) == 1)
                mDistNew = pdist([propresult(n).Centroid(1),propresult(n).Centroid(2);x,maxY],'euclidean');
                if (mDistNew >= mDist)
                   mDist = mDistNew;
                   mDistPoint = [x,maxY+0.5];
                end
            end            
        end
        
        for y = minY:maxY
            if (timage(y,minX) == 1)
                mDistNew = pdist([propresult(n).Centroid(1),propresult(n).Centroid(2);minX,y],'euclidean');
                if (mDistNew >= mDist)
                   mDist = mDistNew;
                   mDistPoint = [minX-0.5,y];
                end
            end
            
            if (timage(y,maxX) == 1)
                mDistNew = pdist([propresult(n).Centroid(1),propresult(n).Centroid(2);maxX,y],'euclidean');
                if (mDistNew >= mDist)
                   mDist = mDistNew;
                   mDistPoint = [maxX+0.5,y];
                end
            end            
        end
        
        disp( propresult(n).Area / (pi*(mDist)^2) );
        centroidArea = (pi*(mDist)^2);
        output(n,5) = propresult(n).Area / centroidArea;
        line([propresult(n).Centroid(1),mDistPoint(1)],[propresult(n).Centroid(2),mDistPoint(2)],'Color','green','LineWidth',4);
        DrawCircle( propresult(n).Centroid(1), propresult(n).Centroid(2), mDist, 64, 'green');

        mDist = 0;
        
%         disp('Blackness Ratio (Bounding box centre circle): ');
%         midX = minX + ((maxX-minX)/2);
%         midY = minY + ((maxY-minY)/2);
%         plot(midX,midY,'*','Color','red')
%         
%         for x = minX:maxX
%             if (timage(minY,x) == 1)
%                 mDistNew = pdist([midX,midY;x,minY],'euclidean');
%                 if (mDistNew >= mDist)
%                    mDist = mDistNew;
%                    mDistPoint = [x,minY-0.5];
%                 end
%             end
%             
%             if (timage(maxY,x) == 1)
%                 mDistNew = pdist([midX,midY;x,maxY],'euclidean');
%                 if (mDistNew >= mDist)
%                    mDist = mDistNew;
%                    mDistPoint = [x,maxY+0.5];
%                 end
%             end            
%         end
%         
%         for y = minY:maxY
%             if (timage(y,minX) == 1)
%                 mDistNew = pdist([midX,midY;minX,y],'euclidean');
%                 if (mDistNew >= mDist)
%                    mDist = mDistNew;
%                    mDistPoint = [minX-0.5,y];
%                 end
%             end
%             
%             if (timage(y,maxX) == 1)
%                 mDistNew = pdist([midX,midY;maxX,y],'euclidean');
%                 if (mDistNew >= mDist)
%                    mDist = mDistNew;
%                    mDistPoint = [maxX+0.5,y];
%                 end
%             end            
%         end        
% 
%         disp( propresult(n).Area / (pi*(mDist)^2) );
%         circumArea = (pi*(mDist)^2);
% %         output(n,6) = propresult(n).Area / circumArea;
%         line([midX,mDistPoint(1)],[midY,mDistPoint(2)],'Color','red','LineWidth',3);
%         DrawCircle( midX, midY, mDist, 64, 'red');        
%         mDist = 0;
        
        
        disp('Centroid circle area/Centre circle area');
        disp(centroidArea/circumArea);
        %output(n,7) = centroidArea/circumArea;
        
        text(minX-10,maxY-5,num2str(n), 'Color', 'white', 'LineWidth', 2);
        

         
        
          
        
        
        disp(' ');
        
    end
    
end



csvwrite(filename,output)

end

