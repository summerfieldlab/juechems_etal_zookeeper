%%

function uniques = get_unique_structs(structlist)

if isempty(structlist)
    uniques = {};
    return;
end

uniques = {};
uniques{1} = structlist{1};
if max(size(structlist)) > 1
        structlist = structlist(2:end);
end

while ~isempty(structlist)
    if ~is_done_state(structlist{1},uniques)
        uniques{end+1} = structlist{1}; 
    end
    if max(size(structlist)) > 1
        structlist = structlist(2:end);
    else
        structlist = {};
    end
end
end