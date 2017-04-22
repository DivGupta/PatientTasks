function fileIOMindVoice(fileName, image, time, response, correct)

if ~exist(fileName, 'file')
    fid = fopen(fileName, 'a');
    fprintf(fid, '%s\t %s\t %s\t %s\n', 'ResponseT(ms)', 'Answer', 'Accuracy', 'ImageN');
    fprintf(fid, '%f\t\t %s\t\t %i\t\t %s\n', time, response, correct, image );
else
    fid = fopen(fileName, 'a');
    fprintf(fid, '%f\t\t %s\t\t %i\t\t %s\n', time, response, correct, image );
end

fclose(fid);
end