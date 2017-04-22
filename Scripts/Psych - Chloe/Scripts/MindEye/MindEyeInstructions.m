function exit = MindEyeInstructions

fontSize = 20;
%can be 'center', 'left', 'right'
alignment = 'left';
    
exit = false;
temp = true;
instruct = sprintf(['INSTRUCTIONS\n\nYou will see a picture of eyes on the ', ...
    'screen, with four words around it. You have to pick the word that best ',...
    'describes the picture as fast as you can. There may be more than one', ...
    ' word that could be used, but remember to pick the best word. \n\n', ...
    'To pick the words, use the letters s, x, k and m on the keyboard.\n',...
    '\t - Press the letter s if you choose the word at the top left corner of the screen.\n', ...
    '\t - Press the letter x if you choose the word at the bottom left corner of the screen.\n', ...
    '\t - Press the letter k if you choose the word at the top right corner of the screen.\n', ...
    '\t - Press the letter m if you choose the word at the bottom right corner of the screen.\n\n', ...
    'Remember, try to choose the best word as fast as you can. If you are unsure about the '...
    'meaning of a word, you can use the definition handout to help you make your decision.\n\n'...
    'Press space bar when you are ready to begin.']);

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