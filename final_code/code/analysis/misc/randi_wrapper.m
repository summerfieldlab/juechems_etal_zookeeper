%% RANDI WRAPPER

function vals = randi_wrapper(imin,imax,n)

assert(size(imin,1) == size(imax,1),'Sizes of imin and imax must match');
vals = nan(size(imin,1),n);

for i = 1:size(imin,1);
    vals(i,:) = randi([imin(i),imax(i)],1,n);
end
end