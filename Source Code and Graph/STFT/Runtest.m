clear all;
n = 2048*32;
options.n = n;
[x,fs] = load_sound('F:\Big Data\Project\STFT\Outside2Person.mp3', n);
%Play the sound


figure;
clf;
plot(1:n,x);
axis('tight');
set_graphic_sizes([], 20);
title('Signal');

% size of the window
w = 64*2;
% overlap of the window
q = w/2;


S = perform_stft(x,w,q, options);
% display the spectrogram
clf; imageplot(abs(S)); axis('on');
% display log spectrogram
figure;
plot_spectrogram(S,x);


