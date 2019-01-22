function psych_draw_text(text,win,rect,y_offset,words,color)

regexpression = sprintf('(\\w*\\S?\\w?\\d*?\\s?){1,%d}',words);

line = regexpi(text,regexpression,'match');
off = y_offset/2 + 25;

for i=1:size(line,2)
    text_width = Screen('TextBounds',win,line{i});
    Screen('DrawText',win,line{i},rect(3)/2-text_width(3)/2,rect(4)/2+off,color);
    off = off + 45; % Lower text by 45 pixels for each line
end

end