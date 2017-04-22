function FauxPasTask(question,story, constants,name)

x = size(story, 1);

storyDisplayed = [];
ScrSize = get(0,'ScreenSize');

check = 0;
checkBreak = false;

close all
while check < x
    answers = {};
    ms = [];
    temp = true;
    temp2 = true;
    while true
        y = randi(x);
        if ~ismember(y, storyDisplayed)
            storyDisplayed = [storyDisplayed, y];
            break
        end
    end
       
    tem1 = story(y,:);
    tem1 = tem1{1};
    
    t0 = clock;
    set(gcf,'CloseRequestFcn', 'closereq')
    close all
    fig = figure('units','pixels',...
              'menubar','none',...
              'name','GUI_1',...
              'numbertitle','off',...
              'resize','off');
    set(gcf,'color','w');
    set(gcf,'Units','pixels','Position',ScrSize);
    uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w', ...
        'String', tem1,'Units','normalized','Position', [0 0 1 .7]); 
    set(fig,'KeyPressFcn',@keyDownListener);    
    set(gcf,'CloseRequestFcn', @closeWindow)
    
    while temp2
        pause(.1)
    end
    
    t0 = clock;
    if temp == true
        [yes, msT] = FauxPasQuestion1(constants);
        answers = [answers, yes];
        ms = [ms, msT];
        index = 1;
    end
    if checkBreak
        break;
    end
    if yes & temp == true
        [ansTemp,msT] = FauxPasQuestion2(constants);
        if isempty(ansTemp)
            ansTemp = 'Nothing Entered';
        end
        answers = [answers, ansTemp];
        ms = [ms, msT];
        index = index+1;
    end
    dur = length(question(:,1)) - 1;
    var = 2;
    while dur > 0 & temp == true
        [ansTemp,msT] = FauxPasQuestionRest(question(var,y));
        if isempty(ansTemp)
            ansTemp = 'Nothing Entered';
        end
        answers = [answers, ansTemp];
        ms = [ms, msT];
        dur = dur - 1;
        var = var+1;
        index = index+1;
    end
    
    check = check+1;
    FauxPasIO(name, answers, ms, y, index)
end

close all

function keyDownListener(src,event)
switch event.Key
    case 'space'
         %ms = [ms , round(etime(clock,t0) * 1000)];
         temp2 = false;
         
end
end
function closeWindow(src,event)
    if closeTask
        set(gcf,'CloseRequestFcn', 'closereq')
        check = 111111111111111111;
        temp = false;
        temp2 = false;
        checkBreak = true;   
    
    else
        checkBreak = false;
    end
end

end










