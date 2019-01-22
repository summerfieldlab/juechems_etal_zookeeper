%% INITIALIZES THE DATA STRUCTURE

data                = struct();

% SUBJECT
data.subject.dir    = curr_dir;
data.exp_subject    = ones(params.n_trials,1)*subject_nr;

% TASK
data.bandit_left    = nan(params.n_trials,2);
data.bandit_right   = nan(params.n_trials,2);
data.state          = {};
data.state{1}       = 'Start';
data.firsts         = zeros(params.n_trials,1);
data.frame          = zeros(params.n_trials,1);
data.frame_length   = zeros(params.n_trials,1);
data.last           = zeros(params.n_trials,1);
data.session        = repmat(1:params.n_sessions,params.n_trials_session,1);
data.session        = reshape(data.session,params.n_trials_session*params.n_sessions,1);
data.countdown      = zeros(params.n_trials,1);

% SCANNING
data.scanningsession= ones(params.n_trials,1);

% CHOICE
data.choice         = nan(params.n_trials,1);
data.rt             = nan(params.n_trials,1);
data.outcome_type   = nan(params.n_trials,1);
data.outcome_yield  = nan(params.n_trials,1);
data.zoo            = zeros(params.n_trials,2);
data.zoo_value      = zeros(params.n_trials,1);
data.zoo_cumu       = zeros(params.n_trials,1);

% TIMING
data.time_start         = zeros(params.n_trials,1);
data.time_fixation      = zeros(params.n_trials,1);
data.time_stimuli       = zeros(params.n_trials,1);
data.time_feedback      = zeros(params.n_trials,1);
data.time_feedback_off  = zeros(params.n_trials,1);
data.time_responded     = zeros(params.n_trials,1);
data.time_trigger       = zeros(params.n_trials,1);
data.time_starttrial    = zeros(params.n_trials,1);
data.time_end           = zeros(params.n_trials,1);

% DO ITI WITH CONSTRAINT ON TOTAL LENGTH OF STUDY
data.ITI = zeros(params.n_trials,1) * params.time_ITI_max;
while abs(sum(data.ITI) - (params.n_trials * ((params.time_ITI_max + params.time_ITI_min) /2))) > params.time_tolerance
data.ITI                = params.time_ITI_min + ... % this is ITI BEFORE(!) trial
                        (params.time_ITI_max - params.time_ITI_min) * ...
                        rand(params.n_trials,1);
end
data.ITI_feedback = zeros(params.n_trials,1) * params.time_ITI_feed_max;
while abs(sum(data.ITI_feedback) - (params.n_trials * ((params.time_ITI_feed_max + params.time_ITI_feed_min) /2))) > params.time_tolerance
data.ITI_feedback                = params.time_ITI_feed_min + ... % this is ITI BEFORE(!) trial
                        (params.time_ITI_feed_max - params.time_ITI_feed_min) * ...
                        rand(params.n_trials,1);
end