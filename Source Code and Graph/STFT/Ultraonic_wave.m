%Sound read
clear all;
n = 4096*32;
options.n = n;
[x,fs] = load_sound('F:\Big Data\Project\STFT\Ultrasonic_17k.wav', n);

recorder = audiorecorder(131072,8,1);
set(recorder,'TimerPeriod',1,'TimerFcn',{@audioTimer});
recordblocking(recorder, T);
seg = getaudiodata(recorder);
fftMag =abs(fft(seg,nfft)); 

subplot(121);plot(t,seg);
subplot(122);plot(f,fftMag(1:numUniq));

%figure;
%clf;
%plot(1:n,x);