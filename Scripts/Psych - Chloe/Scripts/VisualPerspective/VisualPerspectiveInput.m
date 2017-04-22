function blocks = VisualPerspectiveInput

practice = fopen('practice_M.rtf');
blockOne = fopen('block1_M.rtf');
blockTwo = fopen('block2_M.rtf');
blockThree = fopen('block3_M.rtf');
blockFour = fopen('block4_M.rtf');

practiceOrder = [];
blockOneOrder = [];
blockTwoOrder = [];
blockThreeOrder = [];
blockFourOrder = [];
startL = 5;

temp = 1;
while (~feof(practice))
    input = fgetl(practice);
    if temp > startL+1
        if length(input) < 20
            break
        end
        if isempty(strfind(input, 'YOU'))
            target = 'HE';
            loc1 = strfind(input, 'HE');
        else
            target = 'YOU';
            loc1 = strfind(input, 'YOU');
        end
        
        loc = strfind(input, 'S');
        file = input(loc:(loc+7));
        file = [file,'.bmp'];
        
        if ~isempty(strfind(input, '"1"'))
            loc = strfind(input, '"1"');
        elseif ~isempty(strfind(input, '"2"'))
            loc = strfind(input, '"2"');
        elseif ~isempty(strfind(input, '"0"'))
            loc = strfind(input, '"0"');
        else
            loc = strfind(input, '"3"');
        end
        
        num = input(loc+1);
        
        practiceOrder = [practiceOrder; {target, file, num}];
        temp = temp+1;
    else
        temp = temp+1;
    end
end

temp = 1;
while (~feof(blockOne))
    input = fgetl(blockOne);
    if temp > startL
        
        if length(input) < 20
            break
        end
        if isempty(strfind(input, 'YOU'))
            target = 'HE';
        else
            target = 'YOU';
        end
        
        loc = strfind(input, 'S');
        file = input(loc:(loc+7));
        file = [file,'.bmp'];
        
        if ~isempty(strfind(input, '"1"'))
            loc = strfind(input, '"1"');
        elseif ~isempty(strfind(input, '"2"'))
            loc = strfind(input, '"2"');
        elseif ~isempty(strfind(input, '"0"'))
            loc = strfind(input, '"0"');
        else
            loc = strfind(input, '"3"');
        end
        num = input(loc+1);
        blockOneOrder = [blockOneOrder; {target, file,num}];
        temp = temp+1;
    else
        temp = temp+1;
    end
end

temp = 1;
while (~feof(blockTwo))
    input = fgetl(blockTwo);
    
    if temp > startL
        if length(input) < 20
            break
        end
        if isempty(strfind(input, 'YOU'))
            target = 'HE';
        else
            target = 'YOU';
        end
        
        loc = strfind(input, 'S');
        file = input(loc:(loc+7));
        file = [file,'.bmp'];
        
        if ~isempty(strfind(input, '"1"'))
            loc = strfind(input, '"1"');
        elseif ~isempty(strfind(input, '"2"'))
            loc = strfind(input, '"2"');
        elseif ~isempty(strfind(input, '"0"'))
            loc = strfind(input, '"0"');
        else
            loc = strfind(input, '"3"');
        end
        
        num = input(loc+1);
        blockTwoOrder = [blockTwoOrder; {target, file,num}];
        temp = temp+1;
    else
        temp = temp+1;
    end
end

temp = 1;
while (~feof(blockThree))
    input = fgetl(blockThree);
    if temp > startL
        if length(input) < 20
            break
        end
        if isempty(strfind(input, 'YOU'))
            target = 'HE';
        else
            target = 'YOU';
        end
        
        loc = strfind(input, 'S');
        file = input(loc:(loc+7));
        file = [file,'.bmp'];
        
        if ~isempty(strfind(input, '"1"'))
            loc = strfind(input, '"1"');
        elseif ~isempty(strfind(input, '"2"'))
            loc = strfind(input, '"2"');
        elseif ~isempty(strfind(input, '"0"'))
            loc = strfind(input, '"0"');
        else
            loc = strfind(input, '"3"');
        end
        
        num = input(loc+1);
        blockThreeOrder = [blockThreeOrder; {target, file,num}];
        temp = temp+1;
    else
        temp = temp+1;
    end
end

temp = 1;
while (~feof(blockFour))
    input = fgetl(blockFour);
    if temp > startL
        if length(input) < 20
            break
        end
        if isempty(strfind(input, 'YOU'))
            target = 'HE';
        else
            target = 'YOU';
        end
        
        loc = strfind(input, 'S');
        file = input(loc:(loc+7));
        file = [file,'.bmp'];
        
        if ~isempty(strfind(input, '"1"'))
            loc = strfind(input, '"1"');
        elseif ~isempty(strfind(input, '"2"'))
            loc = strfind(input, '"2"');
        elseif ~isempty(strfind(input, '"0"'))
            loc = strfind(input, '"0"');
        else
            loc = strfind(input, '"3"');
        end
        
        num = input(loc+1);
        blockFourOrder = [blockFourOrder; {target, file,num}];
        temp = temp+1;
    else
        temp = temp+1;
    end
end

blocks.practice = practiceOrder;
blocks.one = blockOneOrder;
blocks.two = blockTwoOrder;
blocks.three = blockThreeOrder;
blocks.four = blockFourOrder;

end
