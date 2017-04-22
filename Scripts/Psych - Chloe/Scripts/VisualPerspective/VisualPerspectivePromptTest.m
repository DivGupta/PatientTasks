function name = VisualPerspectivePromptTest
%-------------------------IMPORTANT---------------------------------
%Run this script for VisualPerspective task. Make sure functions below are included
%Associated functions:
%VisualPerspectiveInstructions: Holds text that appears on instructions window after
%   ID prompt
%VisualPerspectiveTask: Holds main body of code, including figuers that user sees and
    %interacts with
%VisualPerspectiveInput: Pulls blocks (along with practice) out of their
    %respective files (ex. 'practice_M.rtf')
%VisualPerspectiveAnswers: Pulls correct answers out of 'Answers.csv' to
    %compare to user response
%VisualPerspectiveIO: creates log file of Response times and answers in directory
    %(see below)
%closetask: Currently in 'MATLAB\Scripts\FauxPas'. The function is needed
%for this task, but as long as it exists in the file path, this task will
%be able to call it.

%directory -> The directory in which the images involved in this study are
%held; note, this variable can be kept at any existing directory as long as
%the scripts and files associted are in the file path. But please do not
%remove it as that would cause errors

%Please email 8dg19@queensu.ca for any clarification
%------------------------------------------------------------------

directory = 'C:\Users\Div\Documents\MATLAB\Psych - Chloe\Visual Perspective Taking Task\Right_handed\M_version';
cd(directory);
ScrSize = get(0,'ScreenSize');
set(0,'Units','pixels','defaultFigurePosition',ScrSize);
check = 1;
while check == 1
    prompts = {'Enter Participant ID Number:'};
    dlg_title = 'VisualPerspective Input';
    num_lines = 1;
    output = inputdlg(prompts,dlg_title,num_lines);
    
    if isempty(output{1})
        check = 1;
    elseif ~isstrprop(output{1}, 'digit')
        check = 1;
    else
        check = 0;
    end
end

ID = output{1}; 
name = [ID, '_', 'VisualPerspective'];

exited = VisualPerspectiveInstructions;
if ~exited
    blocks = VisualPerspectiveInput;
    answers = VisualPerspectiveAnswers;
    VisualPerspectiveTaskTest(name, blocks, answers)
end

end