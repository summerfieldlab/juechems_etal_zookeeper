% This function wraps MATLABs GLM function for easier access
% It expects the data to be stored in a struct() object, with variables as
% field names. You can add a cell object for interactions, which will
% automatically be computed and added to the glm by this function.

function [B, mdl, LL] = fitglm_wrapper(varargin)
% CALL: betas = glm_wrapper(glm_options,data,dependent_variable,{predictor1,predictor2},subjects,interactions,options)

% WARNINGS

% CHECKS
if      length(varargin) < 2 error(sprintf('You have not specified data.\n'));
elseif  length(varargin) < 3 error(sprintf('You have not specified a dependent variable.\n'));
elseif  length(varargin) < 4 error(sprintf('You have not specified any predictors.\n'));
elseif  length(varargin) < 5 error(sprintf('You have not specified any subjects.'));
end

% VARIABLES
glm_options = varargin{1};
data        = varargin{2};
dep_var     = varargin{3};
predictors  = varargin{4};
subjects    = varargin{5};
do_ints     = false;
if length(varargin) > 5 
    interactions = varargin{6};
    do_ints = true;
end
if nargin == 7
    use = varargin{7};
else 
    use = true;
end


% FUNCTION

% fetch values
pred_vals = fetch_values(predictors)';
dep_var     = data.(dep_var)';
mdl = {};

% use_subjects
for sub = subjects
%     disp(sub)
    use_sub     = data.exp_subject == sub;
    use_sub     = use_sub & use; 
    use_vals    = pred_vals(:,use_sub);
    use_dep     = dep_var(use_sub);
    pred_z      = glm_wrapper_z(use_vals); % Do z transf
    
    % get interactions
    if do_ints
        ints    = glm_get_interactions(predictors,interactions,pred_z);
        pred_z  = [pred_z;ints];
    end

    % Do regression
%     [B(sub,:), DEV(sub), STAT(sub)] = fitglm(pred_z',use_dep',glm_options{1},glm_options{2:end});%'binomial','link','probit');
    this_mdl = fitglm(pred_z',use_dep',glm_options{1},glm_options{2:end});%'binomial','link','probit');
    B(sub,:) = this_mdl.Coefficients.Estimate';
    LL(sub)  = this_mdl.LogLikelihood;
    mdl(sub) = {this_mdl};
end

function vals = fetch_values(names)
    if length(names) == 1
        vals = data.(names{1});
    else
        vals = horzcat(fetch_values(names(1:end-1)),data.(names{end}));
    end
end
end

