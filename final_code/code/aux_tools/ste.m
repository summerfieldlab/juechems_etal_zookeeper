
function vste = ste(m,d)
    if ~exist('d','var'); d=1; end
    
    vstd = std(m,1,d);
    vsiz = size(m,d);
    vste = vstd./sqrt(vsiz);

return