
function [m,e,u] = jb_getvector(varargin)
    % [m,e,u] = jb_getvector(y,x1[,x2][,x3][...])
    
    %% variables
    assert(nargin > 1  , 'jb_getvector: error. not enough inputs');
    y = varargin{1};
    x = varargin(2:end);
    l = length(y);
    
    %% assert
    assert(isvector(y) , 'jb_getvector: error. y is not a vector');
    for i=1:nargin-1
        assert(isvector(x) ,    'jb_getvector: error. x(%d) is not a vector',i);
        assert(length(x{i})==l, 'jb_getvector: error. x(%d) has wrong length',i);
    end
    %% set values
    y = y(:);
    for i=1:nargin-1, x{i} = x{i}(:); end
    x = cell2mat(x);
    
    %% numbers
    u = unique(x,'rows');
%     u = sort(u);
    n = size(u,1);
    
    %% get values
    m = nan(n,1);
    e = nan(n,1);
    for i = 1:n
        row = u(i,:);
        ii = findrow(row,x);
        m(i) = nanmean(y(ii));
        e(i) = nanste( y(ii));
    end
    
    %% reshape
    if nargout<3
        s = [];
        for i = 1:size(u,2), s(end+1) = length(unique(u(:,i))); end
        s = fliplr(s);
        if isscalar(s), s(end+1)=1; end
        m = reshape(m,s);
        e = reshape(e,s);
        m = permute(m,fliplr(1:length(size(m))));
        e = permute(e,fliplr(1:length(size(e))));
    end
    
end

function ii = findrow(v,m)
    ii = all(repmat(v,size(m,1),1)==m,2);
end