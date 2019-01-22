%% RESOLVE TRIAL OUTCOME

% Resolve bandit
if ~isnan(choice)
    yield = data.(sprintf('bandit_%s',choice))(trial,1);
    type = data.(sprintf('bandit_%s',choice))(trial,2);
    
    data.outcome_yield(trial) = yield;
    if trial > 1 && data.firsts(trial) == 0
        data.zoo(trial,:) = data.zoo(trial-1,:);
        data.zoo(trial,type) = data.zoo(trial-1,type) + yield;
    else
        data.zoo(trial,:) = [0 0];
        data.zoo(trial,type) = yield;
    end
    data.outcome_type(trial) = type;
    % COMPUTES THE VALUE OF THE ZOO
    data.zoo_value(trial) = min(data.zoo(trial,:));
else % For non-response
    if trial > 1 && data.firsts(trial) == 0
        data.zoo(trial,:) = data.zoo(trial-1,:);
    else
        data.zoo(trial,:) = [0 0];
    end
     data.zoo_value(trial) = 0;
end

% COMPUTES THE RUNNING TALLY
this_frame = data.frame == data.frame(trial) & data.session == data.session(trial);
data.zoo_cumu(this_frame) = cumsum(data.zoo_value(this_frame));

% Clear
clear outcome yield type;