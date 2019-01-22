
function data = write_expected_payoffs_prob(data,trans_p,lookahead,noise)

if nargin < 3
    lookahead = data.countdown;
else
    lookahead = repmat(lookahead,size(data.countdown));
    lookahead(lookahead > data.countdown) = data.countdown(lookahead > data.countdown);
end

data.ev_maxzoo = nan(size(data.trial));
data.ev_minzoo = nan(size(data.trial));
data.ev_maxzoo_boot = nan(size(data.trial));
data.ev_minzoo_boot = nan(size(data.trial));
data.best_action_was_minzoo = zeros(size(data.trial));
data.best_action_prob = nan(size(data.trial));

for i = 1:max(size(data.trial))
%     fprintf('%d\n',i);
    state = fetch_state();
    [~,data.ev_minzoo(i),data.ev_maxzoo(i)] = get_expected_payoff_state(state,trans_p);
%     if data.ev_minzoo(i) > data.ev_maxzoo(i)
%         data.best_action_was_minzoo(i) = 1;
%     end
    actions = sigmoid([0,noise],data.ev_minzoo(i)-data.ev_maxzoo(i));
    data.best_action_prob(i) = actions;
    if rand < actions
        data.best_action_was_minzoo(i) = 1;
    end
end
    
    
    
    function state = fetch_state()
        state = init_state(lookahead(i));
        state.zoodiff = data.zoo_diff_prechoice(i);
        state.maxzoo = data.maxzoo_offer(i);
        state.minzoo = data.minzoo_offer(i);
        state.lookahead = lookahead(i);
        if data.zoo_diff_prechoice(i) == 0
            state.maxzoo = data.max_offer(i);
            state.minzoo = data.min_offer(i);
        end
    end
    
end