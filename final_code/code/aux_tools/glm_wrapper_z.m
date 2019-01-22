function pred_z = glm_wrapper_z(vars)
    if size(vars,1) == 1
        pred_z = ztransf(vars(1,:));
    else
        pred_z = vertcat(glm_wrapper_z(vars(1:end-1,:)),ztransf(vars(end,:)));
    end
end