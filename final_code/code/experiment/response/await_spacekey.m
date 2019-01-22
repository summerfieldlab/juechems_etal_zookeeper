responded = 0;
while(~responded)
    [secs code] = KbStrokeWait();
    if find(code) == KbName('space')
        responded = 1;
    end
    if find(code) == KbName('ESCAPE')
        close_psych;
        return;
    end
end
clear responded secs code;