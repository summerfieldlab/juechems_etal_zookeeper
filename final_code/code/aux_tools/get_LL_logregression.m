function LL = get_LL_logregression(data,B,dep_var,predictors,interactions,use,sub,run)

% fetch values
pred_vals = fetch_values(predictors)';
dep_var     = data.(dep_var)';

% use
use_sub     = data.exp_subject == sub;
use_sub     = use_sub & use & data.session == run;
use_vals    = pred_vals(:,use_sub);
use_dep     = dep_var(use_sub);
pred_z      = glm_wrapper_z(use_vals); % Do z transf

% get interactions
if ~isempty(interactions)
    ints    = glm_get_interactions(predictors,interactions,pred_z);
    pred_z  = [pred_z;ints];
end

trial_val = [ones(size(pred_z,2),1),pred_z'] * B';
trial_p   = log_function(trial_val);

LL = log(use_dep' .* trial_p + (1-use_dep') .* (1-trial_p));
LL = sum(LL);
function vals = fetch_values(names)
    if length(names) == 1
        vals = data.(names{1});
    else
        vals = horzcat(fetch_values(names(1:end-1)),data.(names{end}));
    end
end
end