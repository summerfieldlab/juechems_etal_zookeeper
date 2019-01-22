% Draw scaffold
sess = (data.session(trial)-1) * params.n_blocks; %current session
draw_frame;
draw_zoo_feedback;

% Draw trial feedback
if ~isnan(data.choice(trial))
    text = sprintf('%s %01.1f %s',params.txt_feedback_gain,params.reward_frac*data.zoo_value(trial),params.reward_unit);
    DrawFormattedText(w,text,'center',params.zoo_pos_mid(2) + 0.15*rect(4),params.frame_colors(sess+data.frame(trial),:),60);
else
    text = sprintf('%s',params.txt_feedback_idle);
    DrawFormattedText(w,text,'center',params.zoo_pos_mid(2) + 0.15*rect(4),params.frame_colors(sess+data.frame(trial),:),60);
end

clear text;