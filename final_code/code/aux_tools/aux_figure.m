%% CUSTOM FIGURE
function h = aux_figure(varargin)
% copyright: Keno Jüchems 2015
if isempty(varargin)
    h = figure;
else h = varargin{1};
end

% if ishandle(h)
% else
%     h = figure;
% end

black = [0 0 0];
white = [1 1 1];
grey  = [0.75 0.75 0.75];

% h = figure;
h.Color = white;
ax = gca;

ax.FontName = 'Helvetica';
ax.FontSize = 15;
ax.LineWidth= 2;
ax.XColor   = black;
ax.YColor   = black;
ax.Box      = 'off';

ch = allchild(ax);

for i = 1:length(ch)
    if ishandle(ch(i))
        b = ch(i);
        if isprop(b,'FaceColor')
%             b.FaceColor = grey;
        elseif isprop(b,'LineWidth')
            b.LineWidth = 2.5;
        elseif isprop(b,'EdgeColor')
            b.EdgeColor = black;
        elseif isprop(b,'Color')
            b.Color = black;
        elseif isprop(b,'MarkerEdgeColor')
            b.MarkerEdgeColor = black;
        elseif isprop(b,'MarkerFaceColor')
            b.MarkerEdgeColor = grey;
        end
    end
end
end


