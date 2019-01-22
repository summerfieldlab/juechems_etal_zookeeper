%% This function waits for the trigger to come

% Show an empty screen
DrawFormattedText(w,params.txt_trigger,'center','center',params.psych_background_white);
Screen('Flip',w);

no_trigger = 1;
time_start = GetSecs();
time_this  = time_start;
while no_trigger && (time_this - time_start) < params.time_await_trigger
    [~, time_this, code] = KbCheck();
    if find(params.key_trigger == find(code));
        indx = data.session == data.session(trial);
        data.time_trigger(indx) = repmat(GetSecs(),1,params.n_trials_session);
        no_trigger = 0;
        Screen('Flip',w);
    end
end

%% TODO: REWORK SO PROGRAM DOESNT CHRASH IF NO TRIGGER RECEIVED!
if no_trigger == 1
    error(params.txt_error_trigger);
end

% After trigger has been received, program waits for some time to continue
WaitSecs(params.time_wait_post_trigger);

clear time_start time_this no_trigger secs code indx