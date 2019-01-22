
function new_state = get_new_state(state,action,flag_overshoot)

new_state = state;
new_state.c = state.c - 1;

if new_state.c == 0
    new_state.end = true;
end

if strcmp(action,'minzoo')
    new_state.zoodiff = abs(state.zoodiff - state.minzoo);
elseif strcmp(action,'maxzoo')
    new_state.zoodiff = state.zoodiff + state.maxzoo;
end

if flag_overshoot == 1
    minzoo = state.minzoo;
    state.minzoo = state.maxzoo;
    state.maxzoo = minzoo;
end

if rand < 0.7
    if state.minzoo < state.maxzoo
        new_state.minzoo  = randi([1,3]);
        new_state.maxzoo  = randi([4,6]);
    else
        new_state.minzoo  = randi([4,6]);
        new_state.maxzoo  = randi([1,3]);
    end
else
    if state.minzoo < state.maxzoo
        new_state.minzoo  = randi([1,3]);
        new_state.maxzoo  = randi([4,6]);
    else
        new_state.minzoo  = randi([4,6]);
        new_state.maxzoo  = randi([1,3]);
    end
end
end