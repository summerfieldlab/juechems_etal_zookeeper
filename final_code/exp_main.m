function exp_main(subject_nr,run,w,rect)

%% INITIALIZE
initialize_task;
% SAVE
save([data.subject.dir,filesep,sprintf('data_%02d',run)],'params','data','sub','bonus','lottery');

%% START TRIALS
% Try-catch if something goes wrong
try

    %% SETUP
    Screen('TextColor',w,params.psych_background_white);

    % LOAD IMAGE DATA
    load_animals;
    % Make textures for easy access
    img_textures{1} = Screen('MakeTexture',w,img_animal{1});
    img_textures{2} = Screen('MakeTexture',w,img_animal{2});
    
    % Get textbounds for zoo
    b_small = Screen('TextBounds',w,'4');
    b_big   = Screen('TextBounds',w,'10');
    
    if run == 0
        %% SHOW WELCOME AND START SCREEN
        instructions = load([params.dir_study,filesep,'data',filesep,'texts',filesep,'text_welcome']);
        psych_instructions(w,instructions,80);

    end
    
    %% TRIAL LOOP
    for trial = 1:params.n_trials
        
        %% HANDLE TRIGGER (for new runs)
        handle_trigger;
        
        %% FIXATION CROSS
        time = GetSecs; 
        data.time_starttrial(trial) = time+data.ITI(trial);
        data.time_fixation(trial) = time+data.ITI(trial);
        WaitSecs(data.ITI(trial));
        psych_draw_fixation(w,rect,20,2,0,[],params.psych_background_white);

        %% DRAW STIMULI
        WaitSecs(params.time_fixation);
        psych_draw_stimuli;
        Screen('Flip',w);
        data.time_stimuli(trial) = GetSecs();

        %% RESPONSE
        handle_response;
        WaitSecs(params.time_stim_present - data.rt(trial));
        % GO TO BLANK SCREEN AFTER PRESENTATION
        Screen('Flip',w);
        WaitSecs(data.ITI_feedback(trial));
       
        %% FEEDBACK
        do_feedback;
        Screen('Flip',w);
        data.time_feedback(trial) = GetSecs();
        WaitSecs(params.time_feedback);
        % GO BACK TO BLANK SCREEN AFTER FEEDBACK
        Screen('Flip',w);
        data.time_feedback_off(trial) = GetSecs();
        
        %% DO BONUS
        if data.countdown(trial) == 1
            do_bonus;
        end
        
        %% DO LOTTERY
        if mod(trial,params.n_trials_session) == 0
            do_lottery;
            % Wait so that scanner and task are synchronized
            WaitSecs(params.time_waitend); 
            data.time_end = repmat(GetSecs(),params.n_trials,1);
        end  
        
%         %% SAVE CURRENT DATA
%         save([data.subject.dir,filesep,sprintf('data_%02d',run)],'params','data','sub','bonus','lottery');
    end
        
    %% EXIT PSYCHTOOLBOX AND SAVE DATA
%     close_psych;
    save([data.subject.dir,filesep,sprintf('data_%02d',run)],'params','data','sub','bonus','lottery');
%     clearvars -except params data sub bonus lottery;
    
catch ME
    close_psych;
    dump_dir = [data.subject.dir,filesep,'error_dump',filesep];
    mkdir(dump_dir);
    save([dump_dir,sprintf('data_%02d',run)],'params','data','sub','bonus','lottery');
    rethrow(ME);
end

end



