function [x,fs] = load_sound(name, n0, options)

 options.null = [];
[x,fs] = audioread(name);
if size(x,1)<size(x,2)
    x = x';
end
if size(x,2)>1
    x = x(:,1);
end
x = x(:);


if strcmp(name, 'bird')
    sel = [1:6000 12500:15000 22500:24000 32500:3400];
    x(sel) = [];
end
if strcmp(name, 'spectrogram')
    x = x(5800:end);
end
if strcmp(name, 'aeio')
    x = x(15000:end);
end
if strcmp(name, 'acha')
    x = x(14000:end);
end
if strcmp(name,'aherohasfallen')
    x = x(5000:2^14+5000);
end
if strcmp(name,'sentence')
    x = x(3300:end);
end

if strcmp(name, 'tiger')
    x = x(2000:end);
end
if strcmp(name, 'drums')
    x = x(4800:12500);
end

n = size(x,1);
subsampling = getoptions(options, 'subsampling', 1);
if subsampling~=1    

    fs = fs*subsampling;
    t = linspace(0,1,n);
    ti = linspace(0,1,round(n*subsampling));
    x = interp1( t,x,ti );     
    x = x(:);
end

if not(isempty(n0)) && n0<n
    x = x(1:n0);
end
x = x/max(abs(x));