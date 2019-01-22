%% INITIALIZES THE LOTTERY

lottery             = struct();
lottery.exp_subject = ones(params.n_sessions)*data.exp_subject(1);

% TIME BFEORE LOTTERY ONSET
lottery.ITI = zeros(params.n_sessions,1) * params.time_lottery_ITI_max;
while abs(sum(lottery.ITI) - (params.n_trials * ((params.time_lottery_ITI_max + params.time_lottery_ITI_min) /2))) > params.time_tolerance
lottery.ITI                = params.time_lottery_ITI_min + ... % this is ITI BEFORE(!) lottery
                        (params.time_lottery_ITI_max - params.time_lottery_ITI_min) * ...
                        rand(params.n_trials,1);
end

lottery.value	= nan(1,params.n_sessions); % Amount paid out to subjects
lottery.time    = nan(1,params.n_sessions); % Onset time of lottery screen