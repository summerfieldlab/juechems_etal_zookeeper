%% Returns the transition probabilities and next states for a given state
% and action

function [p,states] = get_transition_p(state,action,trans_p)

if strcmp(action,'minzoo')
    if state.zoodiff - state.minzoo < 0
        state.zoodiff = abs(state.zoodiff - state.minzoo);
        minzoo = state.minzoo;
        state.minzoo = state.maxzoo;
        state.maxzoo = minzoo;
    else
        state.zoodiff = abs(state.zoodiff - state.minzoo);
    end
elseif strcmp(action,'maxzoo')
    state.zoodiff = state.zoodiff + state.maxzoo;
end

% state.c = state.c - 1;
%% ALL POSSIBLE STATES
    if state.minzoo < state.maxzoo
        a = trans_p;
        b = 1-trans_p;
    else
        a = 1-trans_p;
        b = trans_p;
    end
    p(1:9) = a/9;
    p(10:18) = b/9;
    
    states = get_possible_states(state);
end