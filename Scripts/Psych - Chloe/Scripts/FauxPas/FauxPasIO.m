function FauxPasIO(fileName, answer, reactionT, storyNum, index)

if ~exist(fileName, 'file')
    fid = fopen(fileName, 'a');
    fprintf(fid, '%s\n %s\n' , 'Story#', '-------------------');
    fprintf(fid, '%s\n %s\n %s\n\n\n', 'Question#', 'Answer', 'ResponseT(ms)');
else
    fid = fopen(fileName, 'a');
end

fprintf(fid, '%s%i\n %s\n' , 'Story:', storyNum, '-------------------');
counter = 1;

for z= 1:index
    temp = answer(z);
    temp = temp{1};
    if isnumeric(temp) 
        temp = num2str(temp);
    end
    fprintf(fid, '%i\n %s\n %f\n\n', counter, temp, reactionT(z) );
    counter = counter+1;
end


fclose(fid);
end