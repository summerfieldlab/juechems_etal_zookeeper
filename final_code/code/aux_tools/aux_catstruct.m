function data = aux_catstruct(data,d)

fields = fieldnames(d);
old_fields = fieldnames(data);

assert(size(fields,1) == size(old_fields,1),'Fields must be the same');


for field = 1:max(size(fields))
    curr_field = (fields{field});
    if isstruct(d.(curr_field))
        data.(curr_field) = aux_catstruct(d.(curr_field));
    end
    if size(data.(curr_field),1) > size(data.(curr_field),2)
        data.(curr_field) = vertcat(data.(curr_field),d.(curr_field));
    else
        data.(curr_field) = horzcat(data.(curr_field),d.(curr_field));
    end
end
end