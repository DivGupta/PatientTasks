function [question,story, constants] = FauxPasQuestions(directory)

cd(directory)
fid = fopen('task.txt');

constants = {'In the story did someone say something that they should not have said?';...
    'What did they say that they should not have said?'};
story = {};
storyTemp = [];
question = [];
questionTemp =[];
check = 1;
counter = 1;
questionCount = 1;

skip = 1;

while (~feof(fid))
    temp1 = fgetl(fid);
    if isempty(temp1)
        if check == 1
            story{counter,1} = storyTemp;
            storyTemp= [];
            counter = counter + 1;
            check = 0;
            skip = 1;
        elseif check == 0
            questionCount = 1;
            question = [question, questionTemp];
            check = 1;
        end
    end
    if check == 1
        if skip == 1
            storyTemp = [storyTemp, temp1(3:length(temp1))];
            skip == 0;
        else
            storyTemp = [storyTemp, temp1];
        end
    elseif check == 0
        questionTemp{questionCount,1} = temp1;
        questionCount = questionCount +1;
    end
end
question = [question, questionTemp];

fclose(fid);
end