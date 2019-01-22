%% ANALYZES THE CHOICE DATA

% SETTINGS
predictors = {'zoo_mintype_offerdiff',...
              'zoo_diff_prechoice',...
              'frame_length'...
              };
          
interactions = {...
                };
legend          = horzcat(  'Constant',...
                            predictors...
                          );

% RUN GLM
[B_1, mdl_1, LL_1]   = fitglm_wrapper_crossval(options,data,dep_variable,predictors,subjects,interactions,use,1);
% PLOT RESULTS
% [~, h]           = errorplot(mean(B_1(subjects,:,:),3),legend,'axis');
[~,p,~,t]        = ttest(mean(B_1(subjects,:,:),3),0);
% title(sprintf('Log regression %s',dep_variable));

% PRINT
fprintf('\nRegression 1\n');
fprintf('\n%-20s \tT-Values: \t P-values \t DF \t\n\n','Regressor');
for i = 1:size(t.tstat,2)
    fprintf('%-20s \t %-+2.4f \t %2.8f \t %d\n',legend{i},t.tstat(i),p(i),t.df(i));
end
 