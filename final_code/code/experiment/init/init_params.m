KbName('UnifyKeyNames');

%% PARAMETERS
params                   = struct();

% PSYCHTOOLBOX
params.psych_background_black  = [127 127 127];
params.psych_background_white  = [255 255 255];
params.psych_text_color        = [255 255 255];
if ~exist('rect','var')
    params.rect                = [0 0 1920 1028];
else 
    params.rect                = rect;
end


% FOLDERS
params.dir_study         = fileparts(which('exp_main.m'));

% SETTINGS

params.response_keys     = [KbName('leftArrow'),...
                            KbName('rightArrow')...
                            ];
params.types             = {'lion',...
                            'elephant'...
                            };
params.n_blocks          = 5;
params.block_min         = 10;
params.block_max         = 20;
params.key_trigger       = KbName('S');
params.n_sessions        = 1;
params.n_trials_session  = 65;
params.n_trials          = params.n_trials_session * params.n_sessions;
                        
% BANDIT SETTINGS
params.bandit_yield      = [[4,6];...
                            [1,3] ...
                            ];

% MARKOV CHAIN
params.mc_transition     = [0.7,0.15,0.15];
params.mc_change_within  = 0.15;
                        
params.states            = {'Stay',...
                            'Shift'};
% TIMING
params.time_max_rt            = 2.5;
params.time_stim_present      = 2.5;
params.time_fixation          = 0.15;
params.time_ITI_min           = 2;
params.time_ITI_max           = 6;
params.time_ITI_feed_min      = 1.5;
params.time_ITI_feed_max      = 4.5;
params.time_feedback          = 1;
params.time_bonus             = 2;
params.time_bonus_ITI_min     = 0.5;
params.time_bonus_ITI_max     = 1.5;
params.time_lottery           = 2;
params.time_lottery_ITI_min   = 0.5;
params.time_lottery_ITI_max   = 1.5;
params.time_await_trigger     = 15;
params.time_wait_post_trigger = 10;
params.time_waitend           = 10;
params.time_tolerance         = 0.5; % Tolerance for absolute length of ITIs

% STIMULUS
params.stim_oval_size           = 0.05*params.rect(4);
params.stim_out_ovalsize        = 0.06*params.rect(4);
params.stim_in_ovalsize         = 0.05*params.rect(4);
params.frame_color              = [255 0 0];
params.frame_left               = 0.25*params.rect(3);
params.frame_right              = 0.75*params.rect(3);
params.frame_yoffset            = 0.1* params.rect(4);
params.screen_background        = [0 0 0];

params.zoo_midpoint             = [0.5*params.rect(3),0.5*params.rect(4)];
params.zoo_ovalsize             = 0.25*params.rect(4);
params.zoo_animal1              = [params.zoo_ovalsize; 0];
params.zoo_pos_left             = [0.4*params.rect(3),0.41*params.rect(4)]; %left zoo animal
params.zoo_pos_mid              = [0.5*params.rect(3),0.41*params.rect(4)]; %centre zoo animal
params.zoo_pos_right            = [0.6*params.rect(3),0.41*params.rect(4)]; %right zoo animal
params.zoo_penwidth             = 5;

params.pngsize                  = 140;

params.zoo_animal1_frac_size    = 0.15 * params.zoo_ovalsize/params.pngsize;
params.zoo_animal1_frac_xpos    = 2.2  * params.zoo_animal1_frac_size;
params.zoo_animal2_frac_size    = 0.15 * params.zoo_ovalsize/params.pngsize;
params.zoo_animal2_frac_xpos    = 1.8    * params.zoo_animal2_frac_size;

params.zoo_feedback_size        = 2.5  * params.zoo_animal1_frac_size;

% Frame colours
for i = 1:params.n_sessions
    indx = ((i-1) * params.n_blocks)+1:(i*params.n_blocks);
    these_colors        = 255 .* hsv2rgb(   [   mod(linspace(0,1,params.n_blocks+1)+rand(),1);...
                                                        ones(1,params.n_blocks+1);...
                                                        ones(1,params.n_blocks+1)...
                                                    ]');
    params.frame_colors(indx,1:3)        = these_colors(randperm(params.n_blocks),:);
end
clear these_colors indx

% TEXTS
params.txt_bonus            = 'Has acumulado en este zoo:';
params.txt_lottery          = 'Has ganado:';
params.txt_trigger          = 'Esperando trigger...';
params.txt_feedback_gain    = 'Valor adquirido:\n\n ';
params.txt_feedback_idle    = 'No has respondido.\n\n Ningun valor adquirido.';
params.txt_error_trigger    = 'No trigger received. Please restart.';

% REWARD
params.reward_frac          = 1; % They get 100% of the number of animals as reward
params.reward_unit          = 'centimos';

% SUBJECTS STRUCTURE
sub = struct();
