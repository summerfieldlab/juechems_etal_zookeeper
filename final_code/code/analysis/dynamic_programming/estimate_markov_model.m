%% RUN THE MARKOV MODEL

transitions = [0,0.1:0.05:0.65,0.75:0.05:0.9,1];
lookahead = 1:20;
tic;
for l = 1:max(size(lookahead))
    for t = 1:max(size(transitions))
        
        global exp_payoff_minzoo
        global exp_payoff_maxzoo
        global exp_payoffs
        
        exp_payoffs = ones(140,6,6,20)*-1;
        exp_payoff_minzoo = ones(140,6,6,20)*-1;
        exp_payoff_maxzoo = ones(140,6,6,20)*-1;
        
        s = init_state(1);
        s.lookahead = lookahead(l);
        trans_p = transitions(t);
        
%         get_expected_payoff_state(s,trans_p);
        
        for i = 1:max(size(exp_payoffs(:)))
            [d,minz,maxz,c,~] = ind2sub(size(exp_payoffs),i);
            s.zoodiff = d-1;
            s.minzoo  = minz;
            s.maxzoo  = maxz;
            s.c       = c;
            if c >= lookahead(l)
                s.lookahead = lookahead(l);
%                 s.c = s.lookahead;
            else
                s.lookahead = c;
            end
            % Skip states that would not occur in task
            if max([minz,maxz]) < 4 || min([maxz,minz]) > 3 || maxz == minz || (d-1) > (6*(20-c))
                continue;
            end
            % Write expected payoffs in variable
            try
                get_expected_payoff_state(s,trans_p);
            catch
                fprintf('Error at zoodiff: %d and countdown: %d\n',s.zoodiff,s.c);
                continue;
            end
        end
        
        % Print
        fprintf('Reference payoff for %1.2f and lookahead %d is: %5.1f\n',trans_p,lookahead(l),exp_payoff_maxzoo(2,3,4,10)-exp_payoff_minzoo(2,3,4,10));
        
        clearvars -except actions exp_payoffs lookahead exp_payoff_minzoo exp_payoff_maxzoo trans_p transitions t l
        name = strrep(['data',filesep,'simulations',filesep,'simu_MDPs',filesep,sprintf('lookahead%d_state_transitions_%1.2f',lookahead(l),trans_p)],'.','_');
        save(name);
    end
end
toc;


