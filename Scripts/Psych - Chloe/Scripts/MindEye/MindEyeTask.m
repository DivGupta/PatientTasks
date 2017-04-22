function MindEyeTask(name, directory)

cd(directory);
contents = ls;
x = size(contents, 1);
images = [];
first = [];

for i=1:x
    if strfind(contents(i,:), 'practice')
        first = contents(i,:);
    elseif  strfind(contents(i,:), '.png');
       images = [images; contents(i,:)];
    end
end

x = size(images, 1);
check = -1;
imageDisplayed = [];
pressed = '';
reactionTime = 0;
ScrSize = get(0,'ScreenSize');
while check < x
    temp = true;
    temp1 = true;
    if check == -1
        t0 = clock;
        [I,map] = imread(first(1,:),'png');
        fig = figure('units','pixels',...
              'menubar','none',...
              'name','GUI_1',...
              'numbertitle','off',...
              'resize','off');
        imshow(I,map);
        set(gcf,'color','w');
        set(gcf,'Units','pixels','Position',ScrSize);
        set(fig,'KeyPressFcn',@keyDownListener)
        set(gcf,'CloseRequestFcn', @closeWindow)
        hold on
        while temp 
            pause(.1) 
        end
        check = check +1;
        
        if ~temp1 
            break
         end
        set(gcf,'CloseRequestFcn', 'closereq')
        close all
        fig = figure('units','pixels',...
              'menubar','none',...
              'name','GUI_1',...
              'numbertitle','off',...
              'resize','off');

        set(gcf,'color','w');
        set(gcf,'Units','pixels','Position',ScrSize);
        set(gcf,'KeyPressFcn',@keyDownListener3)
        set(gcf,'CloseRequestFcn', @closeWindow)
    
        if pressed == 'k'
            correct = 1;
            uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w', ...
        'String', sprintf('Correct! \n\n You have completed the practice item. Press the spacebar to continue'), ...
        'Units','normalized','Position', [0 0 1 .6]); 
            while temp1
                pause(0.1);
            end
        else 
            correct = 0;
            uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w', ...
        'String', sprintf('Inorrect! \n\n You have completed the practice item. Press the spacebar to continue'), ...
        'Units','normalized','Position', [0 0 1 .6]); 
            while temp1
                pause(0.1);
            end
        end

        fileIOMindEye(name, 'Practice' , reactionTime, pressed, correct);
    else
        hold on
        set(gcf,'color','w');
        set(gcf,'Units','pixels','Position',ScrSize);
        set(gcf, 'numbertitle','off', 'resize', 'off', 'menubar', 'none');
        while true
            y = randi(x);
            if ~ismember(y, imageDisplayed)
                imageDisplayed = [y, imageDisplayed];
                break
            end
        end
        [I,map] = imread(images(y,:),'png');
         t0 = clock;
        imshow(I,map);  
        set(gcf,'color','w');
        set(gcf,'Units','pixels','Position',ScrSize);
        set(fig,'KeyPressFcn',@keyDownListener)
        set(gcf,'CloseRequestFcn', @closeWindow)
        while temp 
            pause(.1) 
        end
        check = check+1;
        tem1 = images(y,:);
        ind = strfind(tem1, '.');
        
        correct = MindEyeCheck(str2num(tem1(5:(ind-1))),pressed);
        fileIOMindEye(name, images(y,:), reactionTime, pressed, correct);
        cla
    end
end
 set(gcf,'CloseRequestFcn', 'closereq')
 close all

if temp1
    fig = figure('units','pixels',...
        'menubar','none',...
        'name','GUI_1',...
        'numbertitle','off',...
        'resize','off');
    set(gcf,'color','w');
    set(gcf,'Units','pixels','Position',ScrSize);
    set(fig,'KeyPressFcn',@keyDownListener2)
    set(gcf,'CloseRequestFcn', @closeWindow)
    uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w', ...
        'String', 'You have completed this task. Please notify the experimenter.', ...
        'Units','normalized','Position', [0 0 1 .6]);
end
    
function closeWindow(src,event)
    if closeTask
        set(gcf,'CloseRequestFcn', 'closereq')
        close all
        temp = false;
        temp1 = false;
        check = 111111111111111111;
    end
end

function keyDownListener(src,event)
switch event.Key
    case 's'
         ms = round(etime(clock,t0) * 1000);
         reactionTime = ms;
         pressed = 's';
         pause(.5)
         temp = false;
    case 'x'
         ms = round(etime(clock,t0) * 1000);
         reactionTime = ms;
         pressed = 'x';
         pause(.5)
         temp = false;
    case 'k'
         ms = round(etime(clock,t0) * 1000);
         reactionTime = ms;
         pressed = 'k';
         pause(.5)
         temp = false;
    case 'm'
         ms = round(etime(clock,t0) * 1000);
         reactionTime = ms;
         pressed = 'm';
         pause(.5)
         temp = false;
         
end
end
function keyDownListener2(src,event)
    switch event.Key
        case 'space'
            if closeTask
                set(gcf,'CloseRequestFcn', 'closereq')
                close all
                temp1 = false;
            end
            
    end
end
function keyDownListener3(src,event)
    switch event.Key
        case 'space'
                set(gcf,'CloseRequestFcn', 'closereq')
                close all
                temp1 = false;     
            
    end
end


end







