%% DOES THE LOTTERY AND DISPLAYS THE VALUE

sess                                  = (data.session(trial)-1) * params.n_blocks; %current session
lottery.value(data.session(trial))    = bonus.value(randi([sess+1,sess+params.n_blocks]));

DrawFormattedText(w,sprintf('%s \n\n %01.1f %s',params.txt_lottery,params.reward_frac*lottery.value(data.session(trial)),params.reward_unit),'center','center',params.psych_background_white);
WaitSecs(lottery.ITI(data.session(trial)));
Screen('Flip',w);
lottery.time(data.session(trial))     = GetSecs();
WaitSecs(params.time_lottery);
Screen('Flip',w);

clear sess;