%% PLOTS THE CORRELATION MATRIX FOR FIG 3

% DEFINE VARIABLES
a = data.outcome_yield;
b = data.increase_in_min;
c = data.increase_in_value;
c(c<0) = 0;
X = [a,b,c];

use = ~isnan(data.choice) & data.exp_subject ~= 15 & data.zoo_was_equal ~= 1;

% GET CORRELATION
r = corr(X(use,:));

% PLOT
figure;
imagesc(r);
ax = gca;
f = gcf;
f.Color = [1 1 1];
ax.XTick = [];
ax.XTickLabel = '';
ax.YTick = [];
ax.YTickLabel = '';
ax.Color = [1 1 1];
colormap(flipud(gray(256)));
c =colorbar;
c.FontSize = 14;


%% RT AND REGRESSORS
[r,p] = corr([data.rt(use),data.offer_diff(use),data.zoo_diff_prechoice(use)])