function vals = fetch_values(src,names)
    if length(names) == 1
        vals = src.(names{1});
    else
        vals = vertcat(fetch_values(names(1:end-1)),src.(names{end}));
    end
end