%%

function h = aux_error(xdata,ydata,errors)

% aux_scatter(xdata,ydata);
ax = gca;
xdiff = 0.2*(diff(ax.XLim)/max(size(xdata)));


for x = 1:max(size(xdata))
    line([xdata(x),xdata(x)],[ydata(x)-errors(x),ydata(x)+errors(x)],'Color',[0 0 0]);
    line([xdata(x)-xdiff,xdata(x)+xdiff],[ydata(x)+errors(x),ydata(x)+errors(x)],'Color',[0 0 0]);
    line([xdata(x)-xdiff,xdata(x)+xdiff],[ydata(x)-errors(x),ydata(x)-errors(x)],'Color',[0 0 0]);
end

end