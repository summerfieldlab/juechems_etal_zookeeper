% Creates the frame structure
for sess = 1:params.n_sessions
    
    indx = data.session == sess;
    % Initialize
    firsts    = zeros(1,params.n_trials_session);
    firsts(1) = 1;
    firsts(end) = 1;
    lengths = params.block_max + 1;
    % Loop until criteria are met
    while (any(lengths > params.block_max) || ... % Check lengths
            any(lengths < params.block_min) || ...
            f(end) > params.n_trials_session-params.block_min-1 ||... % Check starting point
            f(end) < params.n_trials_session-params.block_max-1)
        firsts = zeros(1,params.n_trials_session+1);
        firsts(1) = 1;
        firsts(end) = 1;
        f = randsample(params.block_min:params.block_max,params.n_blocks-1,1);
        f = cumsum(f);
        firsts(f(f < params.n_trials_session)) = 1;
        lengths = diff(find(firsts));
    end
    firsts(end) = [];
    
    % Write into data
    data.firsts(indx)     = firsts';
    last       = diff(data.firsts(indx));
    last(last == -1) = 0;
    data.last(indx)  = [last;1];
    data.frame(indx)      = cumsum(firsts)';
    l_indx = (sess * params.n_blocks - params.n_blocks + 1):(sess*params.n_blocks);
    data.framelength(l_indx)= lengths;
    data.frame_length(indx) = lengths(data.frame(indx))';
    data.trial(indx)      = 1:params.n_trials_session;
    ind = min(find(indx));
    for i=1:params.n_blocks
        data.countdown(ind:ind+lengths(i)-1) = lengths(i):-1:1;
        ind = ind + lengths(i);
    end
    clear f firsts lengths ind indx l_indx;
end
clear f firsts lengths ind indx l_indx;