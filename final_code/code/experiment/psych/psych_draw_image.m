function psych_draw_image(win,tex,x,y,rect)

Screen('DrawTexture',win,tex,[],CenterRect([0 0 x y],rect));

end