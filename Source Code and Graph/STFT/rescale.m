function y = rescale(x,a,b)

if nargin<2
    a = 0;
end
if nargin<3
    b = 1;
end

if iscell(x)
    for i=1:length(x)
        y{i} = rescale(x{i},a,b);
    end
    return;
end

m = min(x(:));
M = max(x(:));

if M-m<eps
    y = x;
else
    y = (b-a) * (x-m)/(M-m) + a;
end


