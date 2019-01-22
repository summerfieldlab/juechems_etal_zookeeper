function close_psych
% get cursor back
ShowCursor;
% get keyboard back
ListenChar(0);
% and close full screen mode
Screen('CloseAll');
end