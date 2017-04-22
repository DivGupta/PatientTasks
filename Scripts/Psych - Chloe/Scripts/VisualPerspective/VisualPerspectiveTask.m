function VisualPerspectiveTask(name, blocks, answers)

practice = blocks.practice;
one = blocks.one;
two = blocks.two;
three = blocks.three;
four = blocks.four;

ansPractice = answers.prac;
ansOne = answers.one;
ansTwo = answers.two;
ansThree = answers.three;
ansFour = answers.four;

x = 6; %for number of blocks (plus practice)

currentBlock = 1;
check = 1;
blockOrder = 1;
ScrSize = get(0,'ScreenSize');

fig = figure('units','pixels',...
    'menubar','none',...
    'name','GUI_1',...
    'numbertitle','off',...
    'resize','off');
set(gcf,'color','w');
set(gcf,'Units','pixels','Position',ScrSize);
set(gcf,'CloseRequestFcn', @closeWindow)
temp1 = true;
while check < x
    
    reactionTime = [];
    allAnswers = {};
    allCorrect = {};
    if check == 1
        counter = size(practice,1);
        temp1 = true;
        for i=1:counter
            set(gcf,'CloseRequestFcn', @closeWindow)
            set(gcf,'KeyPressFcn',@keyDownListener)
            set(gcf,'Units','pixels','Position',ScrSize);
            didSomething = false;
            set(gcf,'color','w');
            set(gcf, 'numbertitle','off', 'resize', 'off', 'menubar', 'none');
            prespec = practice(i, 1);
            prespec = prespec{1};
            file = practice(i,2);
            file = file{1};
            num = practice(i,3);
            num = num{1};
            correct = ansPractice(i);
            correct = correct{1};
            
            [I,map] = imread(file,'bmp');
            if check > 1000
                break;
            end
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', '+','Units','normalized','Position', [0 0 1 .6]);
            pause(.75);
            if check > 1000
                break;
            end
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', '','Units','normalized','Position', [0 0 1 .6]);
            pause(0.5);
            if check > 1000
                break;
            end
            
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', prespec,'Units','normalized','Position', [0 0 1 .6]);
            pause(0.75);
            if check > 1000
                break;
            end
            
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', '','Units','normalized','Position', [0 0 1 .6]);
            pause(0.5);
            if check > 1000
                break;
            end
            
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', num,'Units','normalized','Position', [0 0 1 .6]);
            pause(0.75);
            if check > 1000
                break;
            end
            clf(fig)
            set(gcf,'color','w');
            set(gcf,'Units','pixels','Position',ScrSize);
            imshow(I,map);
            set(gcf,'color','w');
            set(gcf,'Units','pixels','Position',ScrSize);
            set(gcf,'WindowButtonDownFcn', @mybttnfcn);
            t0 = clock;
            
            while ~didSomething
                pause(.01);
                rs = round(etime(clock,t0) * 1000);
                if check > 1000
                    break;
                end
            end
            rs = round(etime(clock,t0) * 1000);
            
            if check > 1000
                break;
            end
            if didSomething
                if (strcmp(click,'normal') & strcmp(correct, 'yes')) | (strcmp(click, 'alt') & strcmp(correct , 'no'))
                    userRes = 'Correct';
                else
                    userRes = 'Incorrect';
                end
            end
            reactionTime = [reactionTime, rs]
            allAnswers = [allAnswers, click]
            allCorrect = [allCorrect, userRes]
            set(gcf,'KeyPressFcn',@keyDownListener3)
            clf(fig)
            temp1 = true;
            set(gcf,'KeyPressFcn',@keyDownListener3)
            set(gcf,'color','w');
            set(gcf,'Units','pixels','Position',ScrSize);
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', [userRes, '. Please press the space bar to continue.'],'Units','normalized','Position', [0 0 1 .6]);
            while temp1
                pause(0.1);
            end
            if check > 1000
                break;
            end
            VisualPerspectiveIO(name, rs, click, userRes, 'practice', i)
        end
        if check > 1000
            break;
        end
        temp1 = true;
        set(gcf,'KeyPressFcn',@keyDownListener3)
        set(gcf,'CloseRequestFcn', @closeWindow)
        set(gcf,'color','w');
        set(gcf,'Units','pixels','Position',ScrSize);
        uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
            'String', 'You have completed the practice block. Please take a break and press the space bar when you are ready to continue.','Units','normalized','Position', [0 0 1 .6]);
        while temp1
            pause(0.1);
        end
        if check > 1000
            break;
        end
        %         VisualPerspectiveIO(name, reactionTime, allAnswers, allCorrect, 'practice' ,counter)
        check = check +1;
        set(gcf,'CloseRequestFcn', 'closereq')
        close all
    else
        fig = figure('units','pixels',...
            'menubar','none',...
            'name','GUI_1',...
            'numbertitle','off',...
            'resize','off');
        set(gcf,'color','w');
        set(gcf,'Units','pixels','Position',ScrSize);
        set(gcf,'CloseRequestFcn', @closeWindow)
        set(gcf,'KeyPressFcn',@keyDownListener)
        counter = size(one,1);
        while true
            
            y = randi(5);
            if ~ismember(y, blockOrder)
                blockOrder = [y, blockOrder];
                if y == 2
                    use = one;
                    correctT = ansOne;
                elseif y == 3
                    use = two;
                    correctT = ansTwo;
                elseif y == 4;
                    use = three;
                    correctT = ansThree;
                else
                    use = four;
                    correctT = ansFour;
                end
                break
            end
        end
        
        for i=1:counter
            
            correct = correctT(i);
            correct = correct{1};
            
            didSomething = false;
            set(gcf,'color','w');
            set(gcf,'Units','pixels','Position',ScrSize);
            set(gcf, 'numbertitle','off', 'resize', 'off', 'menubar', 'none');
            set(gcf,'WindowButtonDownFcn', '');
            click = '';
            prespec = use(i, 1);
            prespec = prespec{1};
            file = use(i,2);
            file = file{1};
            num = use(i,3);
            num = num{1};
            [I,map] = imread(file,'bmp');
            if check > 1000
                break;
            end
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', '+','Units','normalized','Position', [0 0 1 .6]);
            pause(.75);
            if check > 1000
                break;
            end
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', '','Units','normalized','Position', [0 0 1 .6]);
            pause(0.5);
            if check > 1000
                break;
            end
            
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', prespec,'Units','normalized','Position', [0 0 1 .6]);
            pause(0.75);
            if check > 1000
                break;
            end
            
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', '','Units','normalized','Position', [0 0 1 .6]);
            pause(0.5);
            if check > 1000
                break;
            end
            
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', num,'Units','normalized','Position', [0 0 1 .6]);
            pause(0.75);
            if check > 1000
                break;
            end
            clf(fig)
            imshow(I,map);
            set(gcf,'color','w');
            set(gcf,'Units','pixels','Position',ScrSize);
            set(gcf,'WindowButtonDownFcn', @mybttnfcn);
            set(gcf,'CloseRequestFcn', @closeWindow)
            t0 = clock;
            
            while ~didSomething
                pause(.1);
                rs = round(etime(clock,t0) * 1000);
                if check > 1000
                    break;
                end
            end
            rs = round(etime(clock,t0) * 1000);
            click
            correct
            if didSomething
                if (strcmp(click,'normal') & strcmp(correct, 'yes')) | (strcmp(click, 'alt') & strcmp(correct , 'no'))
                    userRes = 'Correct';
                else
                    userRes = 'Incorrect';
                end
            end
            if check > 1000
                break;
            end
            clf(fig)
            reactionTime = [reactionTime, rs];
            allAnswers = [allAnswers, click];
            allCorrect = [allCorrect, userRes];
            VisualPerspectiveIO(name, rs, click, userRes, int2str(y-1),i)
        end
        temp1 = true;
        if check > 1000
            break;
        end
        if currentBlock < 4
            set(gcf,'KeyPressFcn',@keyDownListener3)
            set(gcf,'CloseRequestFcn', @closeWindow)
            set(gcf,'color','w');
            set(gcf,'Units','pixels','Position',ScrSize);
            uicontrol('Style', 'text','fontsize',50,'BackgroundColor','w', ...
                'String', ['You have completed block ', int2str(currentBlock) ,'out of 4. Please take a break and press the space bar when you are ready to continue.'], ...
                'Units','normalized','Position', [0 0 1 .6]);
            while temp1
                pause(0.1);
            end
            
        else
            set(gcf,'CloseRequestFcn', 'closereq')
            close all
        end
        if check > 1000
            break;
        end
        %         VisualPerspectiveIO(name, reactionTime, allAnswers, allCorrect, int2str(y-1) ,counter)
        check = check +1;
        currentBlock = currentBlock+1;
    end
end


set(gcf,'CloseRequestFcn', 'closereq')
close all
newCheck = true;
if check ~= 111111111111111111
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
    while newCheck
        pause(0.1)
    end
end

    function closeWindow(src,event)
        if closeTask
            set(gcf,'CloseRequestFcn', 'closereq')
            close all
            temp1 = false;
            newCheck = false;
            check = 111111111111111111;
        end
    end

    function [] = mybttnfcn(varargin)
        didSomething = true;
        persistent chk
        if isempty(chk)
            chk = 1;
            if chk == 1
                click =  get(gcf, 'selectiontype');
                chk = [];
            end
        else
            chk = [];
        end
        
        
    end
    function keyDownListener2(src,event)
        switch event.Key
            case 'space'
                if closeTask
                    newCheck = false;
                    set(gcf,'CloseRequestFcn', 'closereq')
                    close all
                    
                else
                    newCheck = true
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
    function keyDownListener(src,event)
        switch event.Key
        end
    end
end







