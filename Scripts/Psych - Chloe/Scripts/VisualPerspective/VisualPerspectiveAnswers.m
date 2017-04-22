function output = VisualPerspectiveAnswers

fid = fopen('Answers.csv');
practice = [];
block1 = [];
block2 = [];
block3 = [];
block4 = [];

while (~feof(fid))
   input = fgetl(fid);
   while ~isempty(input)
       if isempty(strfind(input, 'yes'))
            target = 'no';
        else
            target = 'yes';
        end
       
        practice = [practice; {target}];
        input = fgetl(fid);
   end
   
   input = fgetl(fid);
   while ~isempty(input)
       if isempty(strfind(input, 'yes'))
            target = 'no';
        else
            target = 'yes';
       end
        block1 = [block1; {target}];
        input = fgetl(fid);
   end
   
   input = fgetl(fid);
   while ~isempty(input)
       if isempty(strfind(input, 'yes'))
            target = 'no';
        else
            target = 'yes';
        end
       
        block2 = [block2; {target}];
        input = fgetl(fid);
   end
   
   input = fgetl(fid);
   while ~isempty(input)
       if isempty(strfind(input, 'yes'))
            target = 'no';
        else
            target = 'yes';
        end
       
        block3 = [block3; {target}];
        input = fgetl(fid);
   end   
   
   input = fgetl(fid);
   counter = 1;
   while ~isempty(input) & counter < 53
       if isempty(strfind(input, 'yes'))
            target = 'no';
        else
            target = 'yes';
        end
       
        block4 = [block4; {target}];
        input = fgetl(fid);
        counter = counter+1;
   end   
end

output.prac= practice;
output.one = block1;
output.two = block2;
output.three = block3;
output.four = block4;

end