%% HANDLES ALL THE BEHAVIOUR OUTPUT

load([pwd(),filesep,'data',filesep,'all_data',filesep,'data.mat']);
%% LOG REGRESSION AND COMPARISON

paper_log_regression;

%% DESCRIPTIVES

paper_get_descriptives;