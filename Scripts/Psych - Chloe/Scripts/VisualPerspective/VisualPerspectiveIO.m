function VisualPerspectiveIO(fileName, rs, answer, correct, block, i )%,index)

if ~exist(fileName, 'file')
    fid = fopen(fileName, 'a');
    fprintf(fid, '%s\n ' , 'Block Number: #');
    fprintf(fid, '%s\t %s\t %s\n', 'ResponseT(ms)', 'Answer', 'Accuracy');
else
    fid = fopen(fileName, 'a');
end
if i == 1
    fprintf(fid, '%s\t %s\n' , 'Block Number: ', block);
end

% for z= 1:index
%     temp = answer(z);
%     temp = temp{1};
%     
%     temp1 = correct(z);
%     temp1 = temp1{1};
%     
%     temp2 = rs(z);
%     
    fprintf(fid, '%f\t %s\t %s\n', rs, answer, correct);
% end


fclose(fid);
end