%% DRAWS THE TOP FRAMES
indx = (data.session(trial) * params.n_blocks -params.n_blocks+1) :(data.session(trial)*params.n_blocks);
spaces = linspace(params.frame_left,params.frame_right,params.n_blocks);
y = ones(params.n_blocks,1)*params.frame_yoffset;
ovals = [spaces'-params.stim_oval_size,y-params.stim_oval_size,spaces'+params.stim_oval_size,y+params.stim_oval_size];
          
Screen(     w,...
            'FillOval',...
            params.frame_colors(indx,:)',...
            ovals'...
           );

inds = ~isnan(bonus.value(indx));
for i=1:sum(inds)
    bnd = Screen('TextBounds',w,sprintf('%01.1f',params.reward_frac*bonus.value(i+sess)));
    DrawFormattedText(w,sprintf('%01.1f',params.reward_frac*bonus.value(i+sess)),spaces(i)-bnd(3)/2,y(i)+params.stim_oval_size/2+bnd(4),params.frame_colors(i+sess,:));
end

clear spaces ovals y bnd indx