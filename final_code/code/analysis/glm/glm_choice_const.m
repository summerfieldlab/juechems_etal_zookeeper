%% ANALYZES THE CHOICE DATA

data.const = ones(size(data.choice));
options = {'Distribution','binomial','link','logit','Intercept',false};
% SETTINGS
predictors = {'const'...
              };
          
interactions = {...
                };
legend          = horzcat(predictors...
                          );

% RUN GLM
[B_c, mdl_c, LL_c]   = fitglm_wrapper_no_z(options,data,dep_variable,predictors,subjects,interactions,use);
% PLOT RESULTS
% [~, h]           = errorplot(B_c(subjects,:),legend,'axis');
[~,p,~,t]        = ttest(B_c(subjects,:),0);
% title(sprintf('Log regression %s',dep_variable));

% PRINT
fprintf('\nRegression 1\n');
fprintf('\n%-20s \tT-Values: \t P-values \t DF \t\n\n','Regressor');
for i = 1:size(t.tstat,2)
    fprintf('%-20s \t %-+2.4f \t %2.4f \t %d\n',legend{i},t.tstat(i),p(i),t.df(i));
end
 
options = {'Distribution','binomial','link','logit'};