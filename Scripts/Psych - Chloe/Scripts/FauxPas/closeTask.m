function [tf] = closeTask(str,time_out)

N = nargin;

if N==0 
    str = 'Google';  % Default password, just to test code.
    time_out = 3600;  % GUI will stay in uiwait for 1 hour.
elseif N==1 
    time_out = 3600;    
elseif N>2
    error('Only a string input and a timeout are allowed.  See help.')
end

if ~ischar(str)
    str = 'Google';
end

S.PWG = [];  % This will hold the string the user enters.
S.fh = figure('units','pixels',...
              'position',[450 450 300 60],...
              'menubar','none',...
              'name','Verify Password.',...
              'resize','off',...
              'numbertitle','off',...
              'name','GUI_37');
S.tx = uicontrol('style','text',...
                 'units','pix',...
                 'position',[5 20 80 20],...
                 'string','Password:',...
                 'fontweight','bold',...
                 'horizontalalign','left',...
                 'fontsize',11);
S.ed = uicontrol('style','edit',...
                 'units','pix',...
                 'position',[90 20 200 20],...
                 'backgroundcolor','w',...
                 'callback',{@ed_call,S},...
                 'tooltipstring',' Enter your password here.',...
                 'HorizontalAlign','left',...
                 'KeyPressFcn',{@ed_kpfcn,S});
uicontrol(S.ed)  % Put a blinking cursor in edit box.
uiwait(S.fh)  % Suspend other execution until return is pressed.

if strcmp(str,S.PWG)
    tf = true;  % Only if the correct password was passed.
else
    tf = false;  % Incorrect password, or user closed GUI.
end

if ishandle(S.fh)
    close(S.fh) % In case the user timed out.
end

    function [] = ed_call(varargin)  
        % Closes the dialog when user presses return.
        close(S.fh)
        
    end

    function [] = ed_kpfcn(varargin)
        [h,S] = varargin{[1,3]};  % Get calling handle and structure.
        % Deals with user input.
        CC = get(S.fh,'currentcharacter');  % The character user entered.
        num = int8(CC);

        if num == 13  % This is a carriage return.
            return
        end

        E = get(h,'string');  % the string of the edit box.
        % Any key handling other than the return key should be handled
        % in the following if else block.
        if num == 8  % Backspace pressed, update password and screen.
            set(h,'string',E(1:end-1));
            S.PWG = S.PWG(1:end-1);
        elseif num == 127  % The Delete Key: do nothing.
        % On some systems this will delete the symbols.  How would you
        % prevent this?
        elseif ~isempty(num)
            set(h,'string',[E,'*'])  ;  % Print out an asterisk in gui.
            S.PWG = [S.PWG CC];
        end
        % Update the structure.
        % One might think that this is not necessary since these functions
        % are nested within GUI_37.  However this is not true.  When the
        % callback to S.ed was first assigned, the value of S at that
        % instant is what was captured. Note that S.ed does not exist after 
        % the uiwait call in GUI_37, even though it existed right before 
        % the uiwait call!  (Try it to see by placing S.ed after uiwait!)
        set(h,'KeyPressFcn',{@ed_kpfcn,S})  
    end

end