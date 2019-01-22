%% THIS FUNCTION CALLS EXP_MAIN TO START THE EXPERIMENT
% REQUIRES PSYCHTOOLBOX

function exp_main_all(subject,run)

exp_runs = 5;
rng('shuffle');

%% START PSYCHTOOLBOX
Screen('Preference','SkipSyncTests',1);
psych_init = [127 127 127];
[w, rect] = start_psych(psych_init);
Screen('TextColor',w,psych_init);

if ~exist('run','var');
    run = 1;
end

if run == 0
    exp_main(subject,run,w,rect);
else
    for indx = run:exp_runs
        exp_main(subject,indx,w,rect);
    end
end

%% EXIT PSYCHTOOLBOX 
close_psych;

%% DISPLAY REWARD
if run ~= 0
[~,~,lottery] = load_data_sub(subject);
fprintf('\n\t Ha ganado un bonus de %2.2f €\n',0.005*sum(lottery.value));
end
end