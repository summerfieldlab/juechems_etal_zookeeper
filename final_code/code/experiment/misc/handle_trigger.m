% Handles the trigger at every new session
if mod(trial,params.n_trials_session) == 1 && run ~= 0         % New session
    Screen('Flip',w);                               % Go to blank
    await_spacekey;                                 % Pause until instructor continues
    if trial == 1
    data.time_start = repmat(GetSecs(),params.n_trials,1);
    end
    await_trigger;
end