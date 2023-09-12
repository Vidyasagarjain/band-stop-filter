[y,Fs]=audioread("C:\Users\jains\Downloads\ad2.wav");
save press y Fs

filename = 'pp.wav';
audiowrite(filename,y,Fs);
clear y Fs 
[y,Fs] = audioread(filename);

%IIR
bsFilt = designfilt('bandstopiir','FilterOrder',60, ...
         'HalfPowerFrequency1',500,'HalfPowerFrequency2',1500, ...
         'SampleRate',8000);

dataIn = y,Fs;
dataOut = filter(bsFilt,dataIn);

%FIR
bsFilt = designfilt('bandstopfir','FilterOrder',200, ...
         'CutoffFrequency1',500,'CutoffFrequency2',1500, ...
         'SampleRate',8000);

dataIn = y,Fs;
dataOut2 = filter(bsFilt,dataIn);


%Playing audio
%sound(y,Fs)   %Input audio
%pause(10)
%sound(dataOut,Fs)    %IIR audio
%pause(10)
%sound(dataOut2,Fs)   %FIR audio

fs = 8000;
nfft = 2048;
f = linspace(0,fs,nfft);
Y = abs(fft(y,nfft));

figure;
plot(f(1:nfft/2), Y(1:nfft/2));
xlabel('Frequency')


nfft = 2048;
f = linspace(0,fs,nfft);
Y = abs(fft(dataOut,nfft));

figure;
plot(f(1:nfft/2), Y(1:nfft/2));
xlabel('Frequency')

nfft = 2048;
f = linspace(0,fs,nfft);
Y = abs(fft(dataOut2,nfft));

figure;
plot(f(1:nfft/2), Y(1:nfft/2));
xlabel('Frequency')

t = linspace(0,length(y)/fs,length(y));
figure;
plot(t,y)

t = linspace(0,length(dataOut)/fs,length(dataOut));
figure;
plot(t,dataOut)

