% RANDOMIZE ORDER OF STIMULI

% Go through markov chain for all trials
for i=1:params.n_trials
    if mod(i,params.n_trials_session) == 1
        yield   = randperm(2);
        type    = randperm(2);
        % Initialize first trial bandits
        data.bandit_left(i,:)   = [yield(1),type(1)];
        data.bandit_right(i,:)  = [yield(2),type(2)];
        data.state{i} = 'Start';
    else
        % For now initialize with old value
        data.bandit_left(i,:)   = data.bandit_left(i-1,:);
        data.bandit_right(i,:)  = data.bandit_right(i-1,:);
        transition_prob = rand(1);
        if transition_prob <= params.mc_transition(1,1)
            data.state{i} = params.states{1};
        else
            data.state{i} = params.states{2};
            left = data.bandit_left(i,2);
            data.bandit_left(i,2) = data.bandit_right(i,2);
            data.bandit_right(i,2) = left;
        end
        % Do permutation for order of bandits
        new  = randperm(2);
        vals = [data.bandit_left(i,:),data.bandit_right(i,:)];
        data.bandit_left(i,:) = vals([2*new(1)-1,2*new(1)]);
        data.bandit_right(i,:) = vals([2*new(2)-1,2*new(2)]);
    end
end

% Create frame
create_frame;

% Do yields
vals =  [randi_wrapper(params.bandit_yield(data.bandit_left(:,1),1),params.bandit_yield(data.bandit_left(:,1),2),1),...
         randi_wrapper(params.bandit_yield(data.bandit_right(:,1),1),params.bandit_yield(data.bandit_right(:,1),2),1)];
data.bandit_left_yield = data.bandit_left(:,1);
data.bandit_right_yield = data.bandit_right(:,1);    
data.bandit_left(:,1) = vals(:,1);
data.bandit_right(:,1) = vals(:,2);

clear vals yield type new old_order new_state transition_prob;