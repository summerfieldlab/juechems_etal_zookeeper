function ret = glm_get_interactions(pred,ints,vals)

ret = [];
    while ~isempty(ints)
        current_int = ints{1};
        current_val = [];
        while ~isempty(current_int)
            [ignore current_pred] = ismember(current_int{1},pred);
            current_val(end+1,:) = vals(current_pred,:);
            current_int(1) = [];
        end
        ret(end+1,:) = current_val(1,:);
        current_val(1,:) = [];
        while ~isempty(current_val)
            ret(end,:) = ret(end,:) .* current_val(1,:);
            ret(end,:) = ztransf(ret(end,:));
            current_val(1,:) = [];
        end
        ints(1) = [];
    end
end

    