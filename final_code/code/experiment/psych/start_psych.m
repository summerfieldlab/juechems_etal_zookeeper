function [w rect] = start_psych(colour)
% Uses an rgb triplet for argument colour
[w rect] = Screen('OpenWindow',0,colour);
% Some settings
Screen('TextStyle',w,0); % Use normal text (1 for bold)
Screen('TextFont',w,'Helvetica'); % Use HELVETICA font
Screen('TextFont',w,40); % Use 40pt text
Screen('TextSize',w,25); % Change size of text (default: 18)
% Screen('TextColor',w,[1 1 1]); % Use white text
% get rid of output in matlab command window
ListenChar(2);
% Hide the mouse cursor
HideCursor;
% Unify key names to MAC OSX
KbName('UnifyKeyNames');
end