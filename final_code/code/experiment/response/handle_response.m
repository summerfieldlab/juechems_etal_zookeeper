
% WAIT FOR RESPONSE
await_response;

% SAVE RESPONSE DATA
if (RT <= params.time_max_rt)
    data.rt(trial)  = RT;
end
data.choice(trial) = response;

% CHECK RESPONSE
switch data.choice(trial)
    case 1
        choice = 'left';
        offset    = -params.zoo_animal1_frac_xpos*params.zoo_ovalsize;
    case 2
        choice = 'right';
        offset    = params.zoo_animal2_frac_xpos*params.zoo_ovalsize;
    otherwise
        choice = nan;      
end

% RESOLVE CHOICE
trial_gamble_resolve;

% ONLY LEAVE CHOSEN BANDIT ON SCREEN
sess = (data.session(trial)-1) * params.n_blocks; %current session

if ~isnan(choice)
    draw_frame;
    draw_scaffold;
    draw_countdown;
    bnd = Screen('TextBounds',w,num2str(data.(sprintf('bandit_%s',choice))(trial,1)));
    hgt = bnd(4);
    Screen('DrawText',w,num2str(data.(sprintf('bandit_%s',choice))(trial,1)),offset+params.zoo_midpoint(1)-b_small(3)/2,...
                                              params.zoo_midpoint(2)-b_small(4)/2-params.zoo_animal1_frac_size*size(img_animal{data.(sprintf('bandit_%s',choice))(trial,2)},1),...
                                              params.frame_colors(sess+data.frame(trial),:));
    % Draw animal silhouette
    Screen('DrawTexture',w,img_textures{data.(sprintf('bandit_%s',choice))(trial,2)},...
                [],...
                [params.zoo_midpoint(1)-b_small(3)/2+offset-params.zoo_animal1_frac_size*size(img_animal{data.(sprintf('bandit_%s',choice))(trial,2)},2),...
                 params.zoo_midpoint(2)+b_small(4)/2-params.zoo_animal1_frac_size*size(img_animal{data.(sprintf('bandit_%s',choice))(trial,2)},1),...
                 params.zoo_midpoint(1)-b_small(3)/2+offset+2*params.zoo_animal1_frac_size*size(img_animal{data.(sprintf('bandit_%s',choice))(trial,2)},2),...
                 params.zoo_midpoint(2)+b_small(4)/2+params.zoo_animal1_frac_size*size(img_animal{data.(sprintf('bandit_%s',choice))(trial,2)},1)]...
                 );   
end
Screen('Flip',w);

clear RT response pos choice;