%% HANDLES ALL THE INITIALIZING PART OF
curr_dir = [pwd(),filesep(),'data',filesep(),sprintf('sub_%02d',subject_nr)];

if exist(curr_dir,'dir') ~= 7
    % Create directory:
    mkdir(curr_dir);
end

% PARAMETERS
init_params;

% INITIALIZE SUBJECT DATA
init_data;

% INITAILIZE BONUS AND LOTTERY
init_bonus;
init_lottery;

% DO RANDOMIZATION
randomize;