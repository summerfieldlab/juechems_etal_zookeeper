
function data = write_expected_payoffs(data,trans_p,lookahead)

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

for i = 1:max(size(data.trial))
%     fprintf('%d\n',i);
    state = fetch_state();
    [~,data.ev_minzoo(i),data.ev_maxzoo(i)] = get_expected_payoff_state(state,trans_p);
    if data.ev_minzoo(i) > data.ev_maxzoo(i)
        data.best_action_was_minzoo(i) = 1;
    end
%     r_min = 0;
%     r_max = 0;
%     for iter = 1:15
%         this_s = state;
%         this_s.zoodiff = this_s.zoodiff + randi([-2,2]);
%         if this_s.zoodiff < 0
%             this_s.zoodiff = 0;
%         end
%         [~,tmp_min,tmp_max] = get_expected_payoff_state(this_s,trans_p);
%         r_min = tmp_min + r_min;
%         r_max = tmp_max + r_max;
%     end
%     data.ev_minzoo_boot(i) = r_min/15;
%     data.ev_maxzoo_boot(i) = r_max/15;
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