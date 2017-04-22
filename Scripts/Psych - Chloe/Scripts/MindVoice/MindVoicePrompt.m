function name = MindVoicePrompt

%Note, add a feature that requires the user to wait at least 1 second
%before answering?
directory = 'C:\Users\Div\Documents\MATLAB\';%Reading the Mind in the Voice\ReadingTheMindInTheVoice_Revised1';

check = 1;

while check == 1
    prompts = {'Enter Participant ID Number:'};
    dlg_title = 'MindVoice Input';
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
name = [ID, '_', 'MindVoice'];

exited = MindVoiceInstructions;
if ~ exited
    MindVoiceTask(name,directory)
end

end