%% THIS FUNCTION WILL PLOT BARS WITH ERRORBARS AND ADD SIGNIFICANCE ASTERISKS
% above the bars. 

function [p_values handles] = errorplot(matrix,txt_legend,legendstyle)

    % Get means, errors and perform ttests.
    ind = 1:size(matrix,2);
    m = mean(matrix);
    e = ste(matrix);
    [h1 p_values] = ttest(matrix,0);
    h1 = logical(h1);
    
    % General plot settings
    handles.fig = figure;
    hold on;
    xlim([0 size(matrix,2)+1]);
    ydiff = 0.1 * (max(m+e) - min(m-e));
    ydiff_sig = 0.05 * (max(m+e) - min(m-e));
    ylim([min(m-e) - ydiff,max(m+e) + ydiff]);
    set(gca,...
            'FontName','Helvetica',...
            'FontSize',12,...
            'LineWidth',2,...
            'XTick',[],...
            'XAxisLocation','bottom',...
            'Position',get(gca,'Position') + [0 0.15 0 -0.1]);
%     set(specgraph.baseline,'LineWidth',2)
    
    % Plot bars
    handles.b = bar(m,...
                'EdgeColor','k',...
                'LineWidth',2,...
                'FaceColor',[0.7 0.7 0.7]);
            
    % Write legend
    txt_legend = strrep(txt_legend,'_',' '); % Replace underscores
    if strcmp(legendstyle,'axis')
        for i=1:length(txt_legend)
            text(ind(i),  min(m-e)-1.1*ydiff-0.03, txt_legend{i}, 'Rotation', 45, 'FontSize', 12, 'HorizontalAlignment', 'right');
        end
    else
        handles.legend = legend(txt_legend, 'Location', 'NorthEast', 'FontSize',12);
        legend boxoff;
    end
    
    % Add error bars
    handles.err = errorbar(ind,m,e,...
                    'LineStyle','none',...
                    'LineWidth',2,...
                    'Color',[0 33/255 71/255]);
    
    % Add significance asterisks
    pos_sc = sign(m).*(abs(m) + abs(e) + ydiff_sig);
    handles.sc = scatter(ind(h1),pos_sc(h1),'*','k');
    
    % Clean
    hold off;
    handles.ax = gca;
end