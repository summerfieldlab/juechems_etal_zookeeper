%% PARTICIPANTS

f = figure();
load([pwd(),filesep,'data',filesep,'all_data',filesep,'data.mat']);
zoodiff_versus_countdown;
title('Participant data');
xlabel('Trials');
ylabel('Goal difference');
ax = gca;
ax.XTickLabel = '';
ax.YTickLabel = '';
ax.YAxis.Color = [1,1,1];
ax.YTick = [];

%% FITS
f = figure();
load([pwd(),filesep,'data',filesep,'all_data',filesep,'data.mat']);
load([pwd(),filesep,'data',filesep,'fit_zoodiff.mat']);
data.zoo_diff_prechoice = fit_zoodiff;
zoodiff_versus_countdown;
title('Fit data');
xlabel('Trials');
ylabel('Goal difference');
ax = gca;
ax.XTickLabel = '';
ax.YTickLabel = '';
ax.YAxis.Color = [1,1,1];
ax.YTick = [];

%% OPTIMAL
f = figure();
load([pwd(),filesep,'data',filesep,'all_data',filesep,'data.mat']);
load([pwd(),filesep,'data',filesep,'opt_zoodiff.mat']);
data.zoo_diff_prechoice = opt_zoodiff;
zoodiff_versus_countdown;
title('Simulated data');
xlabel('Trials');
ylabel('Goal difference');
ax = gca;
ax.XTickLabel = '';
ax.YTickLabel = '';
ax.YAxis.Color = [1,1,1];
ax.YTick = [];