% Loads the image files for display. 
img_animal    = {};
shuffled      = randperm(2);
img_animal{1} = 255-imread(['data',filesep,'images',filesep,sprintf('%s.png',params.types{shuffled(1)})]);
img_animal{1}(img_animal{1} > 0) = 255;
img_animal{1}(img_animal{1} < 255) = params.psych_background_black(1);

img_animal{2} = 255-imread(['data',filesep,'images',filesep,sprintf('%s.png',params.types{shuffled(2)})]);
img_animal{2}(img_animal{2} > 0) = 255;
img_animal{2}(img_animal{2} < 255) = params.psych_background_black(1);

data.zoo_left = repmat(shuffled(1),params.n_trials_session,1);
data.zoo_right= repmat(shuffled(2),params.n_trials_session,1);
clear shuffled;