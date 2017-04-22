function name = FauxPasPrompt

directory = 'C:\Users\Div\Documents\MATLAB\';

check = 1;

while check == 1
    prompts = {'Enter Participant ID Number:'};
    dlg_title = 'False Belief Input';
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
name = [ID, '_', 'FauxPas'];

[question,story, constants] = FauxPasQuestions(directory);
exited = FauxPasInstructions;
if ~exited
    FauxPasTask(question,story, constants,name);
end

end