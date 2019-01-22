% Test if subject already exists:
sub.dir = [pwd(),filesep(),'data',filesep(),sprintf('sub_%02d',sub.code)];

% If it exists:
while(exist(sub.dir))
    fprintf('Subject with number: %02d already exists.\n',sub.code);
    rep = input('Replace? ');
    if (~rep)
        sub.code = input('Please re-enter subject code: ');
        sub.dir = [pwd(),filesep(),'data',filesep(),sprintf('sub_%02d',sub.code)];
    else
        sure = input(['Are you sure you want to delete all previous data for subject: ',num2str(sub.code),'?']);
        if(sure)
            rmdir(sub.dir,'s');
        end
        clear sure;
    end
    clear rep;
end

% Create directory:
mkdir(sub.dir);