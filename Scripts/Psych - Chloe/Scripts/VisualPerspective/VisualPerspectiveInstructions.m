function exit = VisualPerspectiveInstructions

fontSize = 20;
%can be 'center', 'left', 'right'
alignment = 'left';
    
exit = false;
temp = true;
instruct = sprintf(['INSTRUCTIONS\n\n For each set of eyes, choose and circle which word ',...
'best describes what the person in the picture is thinking or feeling.', ...
'You may feel that more than one word is applicable but please', ...
'choose just one word, the word which you consider to be most', ...
'suitable.  Before making your choice, make sure that you have read', ...
'all 4 words.  You should try to do the task as quickly as possible', ...
'but you will not be timed.  If you really do not know what a word', ...
'means you can look it up in the definition handout.']);

ScrSize = get(0,'ScreenSize');

fig = figure('units','pixels',...
              'menubar','none',...
              'name','GUI_1',...
              'numbertitle','off',...
              'resize','off');
set(gcf,'Units','pixels','Position',ScrSize);
uicontrol('Style', 'text','fontsize',fontSize,'BackgroundColor','w', ...
'String', instruct,'Units','normalized','Position', [0 0 1 1], ...
'HorizontalAlignment', alignment);

set(gcf,'CloseRequestFcn', @closeWindow)
set(fig,'KeyPressFcn',@keyDownListener)
while temp
    pause(1)
end

close all;

function keyDownListener(src,event)
switch event.Key
    case 'space'        
         temp = false;
         set(gcf,'CloseRequestFcn', 'closereq')
    end
end
function closeWindow(src,event)
    if closeTask
        set(gcf,'CloseRequestFcn', 'closereq')
        close all
        temp = false;
        exit = true;
    end
end


end