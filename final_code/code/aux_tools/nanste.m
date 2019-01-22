
function vste = nanste(m,d)
    if ~exist('d','var'); d=1; end
    
    vstd = nanstd(m,1,d);
    vsiz = sum(~isnan(m),d);
    vste = vstd./sqrt(vsiz);

return