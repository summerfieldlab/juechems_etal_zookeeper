

function [payoff,new_state] = get_payoffs(state,action)

if state.end == true
    payoff = 0;
    new_state = state;
    return;
end

flag_overshoot = 0;

if strcmp(action,'maxzoo')
    payoff = 0;
elseif strcmp(action,'minzoo')
    delta_zoodiff = state.zoodiff - state.minzoo;
    if delta_zoodiff < 0
        payoff = state.lookahead * state.zoodiff;
        flag_overshoot = 1;
    else
        payoff = state.lookahead * state.minzoo;
    end
end

if state.zoodiff == 0
    payoff = 0;
end

if nargout > 1
    new_state = get_new_state(state,action,flag_overshoot);
end
end
