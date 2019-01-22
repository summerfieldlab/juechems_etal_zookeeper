%% PLOTS THE ZOO DIFFERENCE AS A FUNCTION OF TRIAL FOR
% DIFFERENT ZOO LENGTHS

use_lengths = [10,12,14,16,18];
colors = [linspace(0.1,0.9,length(use_lengths))',ones(length(use_lengths),1)*0.5,linspace(0.9,0.1,length(use_lengths))'];
h = f;

for i = use_lengths
    use = data.frame_length == i;
    diffs = data.zoo_diff_prechoice(use);
    diffs = reshape(diffs,i,sum(data.framelength == i));
    diffs = [diffs',data.zoo_diff_postchoice(use & data.last == 1)];
    % ALIGNED TO END
    aux_fig_steplot_spline([20;20-unique(data.zootrial(use))],fliplr(diffs),colors(find(use_lengths==i),:),h);
    if i == 1
        hold on;
    end
end
ax = gca;
ax.XLim = [-1,21];
ax.YLim = [0,12];
aux_figure(gcf);
hold off;