%% CREATES A SPLINE INTERPOLATION FOR VALUES PASSED TO THE FUNCTION
% It creates a standard error plot and fills the area within +- 1 standard
% error of the mean

function h = aux_fig_steplot_spline(varargin)

if nargin <= 3
    h = aux_figure();
else
    h = varargin{4};
end

x     = varargin{1};
means = varargin{2};
stes   = ste(means);
means = mean(means);
c     = varargin{3};

f = fit(x(:),means(:),'smoothingspline');
int_x = linspace(min(x),max(x),100);
plot(int_x,f(int_x),'Color',c);
hold on;

f_low = fit(x(:),means(:) - stes(:),'smoothingspline');
f_low = f_low(int_x)';
f_high = fit(x(:),means(:) + stes(:),'smoothingspline');
f_high = f_high(int_x)';

hdl = fill([int_x,fliplr(int_x)],[f_low,fliplr(f_high)],c,'linestyle','none','facealpha',0.35);

end






