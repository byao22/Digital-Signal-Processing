
clear, clc      % clear all variables

%%  Read in the noisy audio signal from the file 'CapnJ.wav' using audioread function
[Signal_Noisy, Fs] = audioread('CapnJ.wav');
Signal_Noisy = Signal_Noisy'; % Change to column vector
N = length(Signal_Noisy);
Index = 0:N-1;

%%  Play the noisy audio signal using sound function
sound(Signal_Noisy, Fs), % Play the "Noisy" audio signal

%% Plot the time-domain noisy signal 



%% Obtain and plot the DTFT magnitude of the noisy signal 
% You can use FFT with a very large number of points
% Plot the normalized magnitude in dB (i.e., 20*log10(mag/max(mag))
% Use Hz for the horizontal frequency axis (based on Fs sampling rate
% obtained above)
% Use proper axis limits for your plot
Signal_Noisy_DTFT = fft(Signal_Noisy, 1e5);
Signal_Noisy_DTFT_Normalized = 20*log(abs(Signal_Noisy_DTFT / max(Signal_Noisy_DTFT)));
figure;
plot(Signal_Noisy_DTFT_Normalized);
title('Normalized DTFT Magnitude of Noisy Signal');
xlabel('Frequency (Hz)');
ylabel('Normalized Amplitude (dB)');


%%  Using fir1 function, design a lowpass FIR filter
% You need to select your filter order as well as the desired cut-off
% frequency. 
% For cut-off, try a few values in 2-4KHz range.
% Play with both cut-off and the filter order till you can properly hear and understand the spoken words.  
% Remember that the cut-off frequency input to fir1 is 0<Wn<1 with 1
% corresponding to the Nyquist rate (i.e., Fs/2 Hz or pi rad/sample)
F_cutoff = 900/Fs; % Lowpass filter cutoff freq in Hz
B = fir1(100,[1e-8, F_cutoff*pi*2]); % Simple lowpass FIR coeffs


%% Obtain and plot the filter normalized mag response
% Again, you can use FFT with a large number of points
Filter_DTFT = fft(B, 1e5);
Filter_DTFT_Normalized = 20*log(abs(Filter_DTFT / max(Filter_DTFT)));
figure;
plot(Filter_DTFT_Normalized);
title('Normalized DTFT Magnitude of Filter');
xlabel('Frequency (Hz)');
ylabel('Normalized Amplitude (dB)'); 


%%  Lowpass filter the "Signal_Noisy" using the filter function and the filter you designed above 
Signal_Filtered = filter(B, 1, Signal_Noisy);

figure(1), clf
subplot(2,1,1) 
plot(Index, Signal_Noisy)
ylabel('Orig. Time Sig. Amp.'),
xlabel('Time (Samples)'),
grid on, zoom on
subplot(2,1,2);
plot(Index, Signal_Filtered);
ylabel('Filtered Time Sig. Amp.');
xlabel('Time (Samples)');

%% Obtain and plot the normalized DTFT mag of your filtered signal
Signal_Filtered_DTFT = fft(Signal_Filtered, 1e5);
Signal_Filtered_DTFT_Normalized = 20*log(abs(Signal_Filtered_DTFT / max(Signal_Filtered_DTFT)));
figure;
plot(Signal_Filtered_DTFT_Normalized);
title('Normalized DTFT Magnitude of Filtered Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
		

%% Play the reduced-noise sound using the sound function
sound(Signal_Filtered, Fs);
