# Notes
Experiment can be run using
exp_main_all(subject_nr,run), where run=1 wil start the scanner session, run=0 will start the training session (with Spanish instructions)

You need to press space to start, and the scanner trigger is the letter S on the keyboard.

code/analysis/ contains most analysis scripts and code to run the DP model 

code/analysis/Figures includes code to display relevant figures. 

code/analysis/aux_tools contrain custom helper functions


# DATA
The data is organised as a struct() object, with fields containing relevant variables. All data has been concatenated across subjects, with data.exp_subject indicating the (anonymized) subject number. The most relevant fields are:

data.choice : indicating whether left (1) or right (2) was chosen
data.choice_was_minzoo : indicates whether subjects chose according to their current needs (i.e. to increase the currently lower tally)

data.countdown : number of trials remaining in context (including current trial)

data.exp_subject : subject number

data.frame : number (1-5) of current context within a scanning session

data.increase_in_min : by how much choice increased the lower asset

data.increase_in_value : by how much choice redressed imbalance between goals

data.minzoo_offer : number of animals offered for lower asset on current trial

data.prox : proximity to end of context, as 1./data.countdown

data.zoo_diff_prechoice : goal difference before a choice was made

data.zoo_min : number of animals in lower asset

data.zoo_was_equal : both assets had equal number of animals before choice

data.zoo : number of animals in zoo AFTER choice (i.e. displayed on subsequent feedback screen)

data.rt : reaction time

data.outcome_type : 1 or 2, indicating which column of data.zoo was increased - correspondence of number to image changed between scanning sessions.
