function psych_draw_fixation(w,rect,size,width,time,pos,color)

if isempty(pos)
    [x_cent, y_cent] = RectCenter(rect);
else
    x_cent = pos(1);
    y_cent = pos(2);
end

x_coords = [-size size 0 0];
y_coords = [0 0 -size size];
all_coords = [x_coords; y_coords];

Screen('DrawLines',w,all_coords,width,color,[x_cent, y_cent]);
Screen('Flip',w,time);
end