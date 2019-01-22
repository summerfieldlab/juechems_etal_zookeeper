%% HANDLES ALL SCREENS SPECIFIED IN INSTRUCTIONS AND DISPLAYS THEM

function psych_instructions(w,instructions,wrapat)

instructions = struct2cell(instructions);
for i = 1:max(size(instructions))
    text = instructions{i};
    DrawFormattedText(w,text,'center','center',[],wrapat,[],[],2);
    Screen('Flip',w);
    await_spacekey;
end
% Go back to blank screen
Screen('Flip',w);
end