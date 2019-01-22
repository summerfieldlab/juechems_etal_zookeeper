function y = shuffle(x)
    assert(isvector(x),'x is not a vector');
    y = x(randperm(length(x)));
end
