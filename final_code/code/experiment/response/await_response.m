start = GetSecs();
responded = 0;
response  = nan;
RT = GetSecs()-start;
while(~(responded) && (RT < params.time_max_rt))
    [down, secs, code] = KbCheck();
    RT = GetSecs()-start;
    if(any(code(params.response_keys))) && sum(code) == 1
        data.time_responded(trial) = GetSecs();
        response = find(params.response_keys == find(code));
        responded = 1;
    elseif find(code) == KbName('ESCAPE')
        close_psych;
        return;
    end  
end
clear responded start code secs down;