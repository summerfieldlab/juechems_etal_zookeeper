%% INITIALIZES THE BONUS STRUCT

bonus = struct();
bonus.value     = nan(1,params.n_blocks*params.n_sessions);
bonus.exp_subject= ones(params.n_blocks)*data.exp_subject(1);

bonus.ITI = zeros(params.n_blocks,1) * params.time_bonus_ITI_max;
while abs(sum(bonus.ITI) - (params.n_trials * ((params.time_bonus_ITI_max + params.time_bonus_ITI_min) /2))) > params.time_tolerance
bonus.ITI                = params.time_bonus_ITI_min + ... % this is ITI BEFORE(!) bonus
                        (params.time_bonus_ITI_max - params.time_bonus_ITI_min) * ...
                        rand(params.n_trials,1);
end
bonus.time      = nan(1,params.n_blocks*params.n_sessions);