%% RUN THE LOG REGRESSION

% SETTINGS
use = ~isnan(data.choice) & data.zoo_was_equal == 0; % exclude no responses and trials with equal assets
options = {'Distribution','binomial','link','logit'};
dep_variable = 'choice_was_minzoo';
subjects = [1:14,16:22];

% LOG REGRESSION 2 
% OFFER DIFF, GOAL DIFF, PROXIMITY, LENGTH OF CONTEXT, GOAL DIFF x PROX
glm_choice_2;

paper_plot_logregression_scatter;