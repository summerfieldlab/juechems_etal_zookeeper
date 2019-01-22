%% FUNCTION TO SCATTER DATA POINTS ON A FIGURE
% 

function handle = aux_scatter(varargin)

xdata = varargin{1};
ydata = varargin{2};

if nargin >= 3
    size_data = varargin{3};
else 
    size_data = 75;
end
if nargin >= 4
    options = varargin{4};
end

% SETTINGS
color = [linspace(0.1,0.5,length(xdata));...RED
         linspace(0.8,0.5,length(xdata));...GREEN
         linspace(0.5,1,length(xdata));...BLUE
         ]';
     
% SCATTER
handle = scatter(xdata,ydata,[],color,'filled');
handle.SizeData = size_data;

if exist('options','var')
    for i = 1:max(size(options))-1
        handle.(options{i}) = options{i+1};
    end
end

end