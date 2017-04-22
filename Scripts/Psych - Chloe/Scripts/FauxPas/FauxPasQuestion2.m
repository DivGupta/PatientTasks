function [answer,ms] = FauxPasQuestion2(constants)

done = 0;
answer = '';
ms = 0;

question = constants(2);
question = sprintf(['QUESTION\n\n', question{1}]);
t0 = clock;
ScrSize = get(0,'ScreenSize');
uicontrol('Style', 'text','fontsize',30,'BackgroundColor','w', ...
    'String', question,'Units','normalized','Position', [0 0 1 1]);
S.pb = uicontrol('style','edit',...
    'unit','normalized',...
    'BackgroundColor','w', ...
    'ForegroundColor', 'k',...
    'fontsize',30, ...
    'position',[.1 .2 .8 .5],...
    'callback',{@userAns});
set(S.pb,'Max',10000);

S.pf = uicontrol('style','pushbutton',...
    'unit','normalized',...
    'BackgroundColor','k', ...
    'ForegroundColor', 'w',...
    'fontsize',30, ...
    'position',[.4 .05 .2 .1],...
    'string','DONE','callback',{@pb_call});

while true & ~isempty(findall(0,'Type','Figure'))
    pause(.1)
    if done
        break
    end
end

    function pb_call(hObject,eventdata)
        done = get(S.pf(1),'val');
        ms = round(etime(clock,t0) * 1000);
    end

    function userAns(hObject, eventdata)
         answer = get(S.pb,'string');
    end
    end
        
    