%% LOG REGRESSIONS FOR PAPER

% SETTINGS
use = ~isnan(data.choice) & data.zoo_was_equal == 0; % exclude no responses and trials with equal assets
options = {'Distribution','binomial','link','logit'};
dep_variable = 'choice_was_minzoo';
subjects = [1:14,16:22];

%% MODELS
% LOG REGRESSION ONLY CONSTANT
glm_choice_const;

% LOG REGRESSION 1 
% OFFER DIFF, GOAL DIFF, LENGTH OF CONTEXT
glm_choice_1;

% LOG REGRESSION 2 
% OFFER DIFF, GOAL DIFF, PROXIMITY, LENGTH OF CONTEXT, GOAL DIFF x PROX
glm_choice_2;

%% SUPPLEMENTARY
% LOG REGRESSION FOR GRREDY CHOICE (FIGURE S4A)
dep_variable = 'choice_was_max';
glm_choice_2;

% LOG REGRESSION FOR 1/RT (FIGURE S4B)
options = {'Distribution','normal','link','identity'};
data.invrt = 1./data.rt;
dep_variable = 'invrt';
glm_choice_2;
