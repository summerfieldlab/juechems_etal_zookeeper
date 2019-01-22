
%%


subjects = [1:14,16:22];
aux_figure();
xs = cumsum(ones(21,size(B_2,2)),2) + normrnd(0,0.05,21,size(B_2,2));
ys = mean(B_2(subjects,1:end,:),3);

% Plot bar
bar(mean(ys),'EdgeColor','k','LineWidth',2,'FaceColor',[1,1,1]);
hold on;
s = aux_scatter(xs(:),ys(:),35,{'CData',[0.7 0.7 0.7]});
aux_error(1:size(B_2,2),mean(ys),ste(ys));

s.MarkerEdgeColor = [0.7 0.7 0.7];
ax = gca;
ax.YLim = [1.05*min(min(ys)),1.05*max(max(ys))];
ax.YLim = [-4,8];
ax.YTickLabel = '';
ax.XTickLabel = '';

aux_figure(gcf);
ax.XLim = [0,size(B_2,2)+1];
ax.LineWidth = 2.5;