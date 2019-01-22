% Draws the simuli on the screen
sess = (data.session(trial)-1) * params.n_blocks; %current session
% Draw bandit outline
draw_scaffold;
% Add circle for countdown
draw_countdown;
% Draw frames
draw_frame;
% Draw bandits
draw_bandits;

clear sess