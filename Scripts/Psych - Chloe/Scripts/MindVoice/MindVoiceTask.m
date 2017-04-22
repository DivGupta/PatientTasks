function MindVoiceTask(name, directory)


const = {'frightened' 'reassuring' 'amused' 'insulted';...
     'tentative' 'impatient' 'confused' 'friendly'};
constAns = [2,1];
order = ['s' 'k' 'x' 'm'];
cd(directory);
contents = ls('miv*.wav');
x = size(contents, 1)
sounds = [];
first = [];

for i=1:x
    if strfind(contents(i,:), 'miv_e1.wav')
        first = [first; contents(i,:)];
    elseif strfind(contents(i,:), 'miv_e2.wav') 
        first = [first; contents(i,:)];
    elseif  strfind(contents(i,:), '.wav') 
       sounds = [sounds; contents(i,:)];
    end
end
x = size(sounds, 1);
check = -2;
soundDisplayed = [];
pressed = '';
reactionTime = 0;
ScrSize = get(0,'ScreenSize');

fig = figure('units','pixels',...
    'menubar','none',...
    'name','GUI_1',...
    'numbertitle','off',...
    'resize','off');
while check < x
    temp = true;
    counter = 0;
    if check < 0
        t0 = clock;
        [y,Fs]=wavread(first(check+3,:)); 
        sound(y,Fs);
        if check == -2
            outputDisplay = const(1,:);
        else 
            outputDisplay = const(2,:);
        end
        set(gcf,'color','w');
        set(gcf,'Units','pixels','Position',ScrSize);   
        uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w','String', ...
            outputDisplay{1},'Units','normalized','Position', [0.1 0.8 0.2 0.1]);
        uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w','String',...
            outputDisplay{2},'Units','normalized','Position', [0.7 0.8 0.2 0.1]);
        uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w','String', ...
            outputDisplay{3},'Units','normalized','Position', [0.1 0.2 0.2 0.1]);
        uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w','String', ...
            outputDisplay{4},'Units','normalized','Position', [0.7 0.2 0.2 0.1]);
        set(fig,'KeyPressFcn',@keyDownListener)
        set(gcf,'CloseRequestFcn', @closeWindow)
        while temp
            counter = counter+1;
            if counter > 5
                break
            end
            pause(1)
        end
        check = check +1;
        if check == -2 & pressed == 'k'
            correct = 1;
        elseif check == -1 & pressed == 's'
            correct = 1;
        else 
            correct = 0;
        end
        fileIOMindVoice(name, 'Practice' , reactionTime, pressed, correct);
        check = check+1
    else
        while true
            y = randi(x);
            if ~ismember(y, soundDisplayed)
                soundDisplayed = [y, soundDisplayed];
                break
            end
        end
        tem1 = sounds(y,:);
        k = strfind(tem1, '.');
        soundByte = str2num(tem1(4:k-1));
        
        outputDisplay = MindVoicefigureText(soundByte);
        t0 = clock;
        [y,Fs]=wavread(sounds(y,:)); 

        set(gcf,'color','w');
        set(gcf,'Units','pixels','Position',ScrSize);   
        uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w','String', ...
            outputDisplay{1},'Units','normalized','Position', [0.1 0.8 0.2 0.1]);
        uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w','String',...
            outputDisplay{2},'Units','normalized','Position', [0.7 0.8 0.2 0.1]);
        uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w','String', ...
            outputDisplay{3},'Units','normalized','Position', [0.1 0.2 0.2 0.1]);
        uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w','String', ...
            outputDisplay{4},'Units','normalized','Position', [0.7 0.2 0.2 0.1]);
        sound(y,Fs);
        set(fig,'KeyPressFcn',@keyDownListener)        
        set(gcf,'CloseRequestFcn', @closeWindow)
        while temp
            pause(1) 
        end
        check = check+1;
        correct = MindEyeCheck(soundByte,pressed);
        fileIOMindVoice(name, tem1, reactionTime, pressed, correct);
    end
end

function keyDownListener(src,event)
switch event.Key
    case 's'
         ms = round(etime(clock,t0) * 1000);
         reactionTime = ms;
         pressed = 's';
         %if reactionTime > 500
            temp = false;
         %end
    case 'x'
         ms = round(etime(clock,t0) * 1000);
         reactionTime = ms;
         pressed = 'x';
         temp = false;
    case 'k'
         ms = round(etime(clock,t0) * 1000);
         reactionTime = ms;
         pressed = 'k';
         temp = false;
    case 'm'
         ms = round(etime(clock,t0) * 1000);
         reactionTime = ms;
         pressed = 'm';
         temp = false;
         
end
end
function closeWindow(src,event)
    if closeTask
        set(gcf,'CloseRequestFcn', 'closereq')
        close all
        temp = false
        check = 111111111111111111;
    end
end

end







