%% DISPLAYS THE BONUS SCREEN
sess = (data.session(trial)-1) * params.n_blocks; %current session
this_bonus = data.zoo_cumu(trial);
bonus.value(sess+data.frame(trial)) = this_bonus;

DrawFormattedText(w,sprintf('%s \n\n %01.1f %s',params.txt_bonus,params.reward_frac*this_bonus,params.reward_unit),'center','center');
WaitSecs(bonus.ITI(sess+data.frame(trial)));
Screen('Flip',w);
bonus.time(sess+data.frame(trial)) = GetSecs();
WaitSecs(params.time_bonus);
Screen('Flip',w);

if trial ~= params.n_trials
    data.zoo_value(trial+1) = 0;
    data.zoo(trial+1,:) = [0,0];
end

clear this_bonus