% convert binary to signed
function y = bin2sign(x)
    y               = ones(size(x));
    y(x(:)==0)      = -1;
    y(isnan(x(:)))  = nan;
end
