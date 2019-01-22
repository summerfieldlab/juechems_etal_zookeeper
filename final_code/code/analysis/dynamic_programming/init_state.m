%% THIS FUNCTION INITIALIZES THE VARIABLE STATE

function state = init_state(lngth)

if lngth <=0 
    error('Sequence length must be larger than 0');
end

state = struct();

state.zoodiff = 0;

if rand < 0.5
    state.minzoo  = randi([1,3]);
    state.maxzoo  = randi([4,6]);
else
    state.minzoo  = randi([4,6]);
    state.maxzoo  = randi([1,3]);
end

state.c = lngth;
state.end = false;
state.exp_payoff = nan;
state.best_action = nan;
state.lookahead = state.c;
end
