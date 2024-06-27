hell = load('radio.mat');
disp(hell);
y = hell.y
fs = hell.fs;            % Sampling frequency                   
T = 1/fs;             % Sampling period      
meas = size(hell.y);
length = meas(1,2);
t = (0:length-1)*T;        % Time vector
figure(1);
plot(t,y);
Y = fft(y);
kilo = 1000;
figure(2);
smally = (abs(fftshift(Y)));
bigy = smally.^2;
fog = (fs/length*(-length/2:length/2-1));
f = (fs/length*(-length/2:length/2-1)) / kilo;
plot(f, bigy,"LineWidth",1);
title("fft Spectrum in the Positive and Negative Frequencies");
xlabel("f (kHz)");
ylabel("|fft(X)|");
figure(3);
db = 10 .* log10(bigy);
plot(f, db,"LineWidth",1);
title("fft Spectrum in the Positive and Negative Frequencies");
xlabel("f (kHz)");
ylabel("dB");
figure(4);
bandwidth1 = ((f >= 31 & f <= 39) | (f <= -31 & f >= -39));
new = bigy .* bandwidth1;
plot(f, new);

figure(5);
mssg = bandwidth1 .* fftshift(Y);
Channel1 = ifft(mssg);
%using absolute value creates an unremovable DC block.
envelope_1 = envelope(Channel1);
mean_1 = mean(envelope_1);
envelope_1 = envelope_1 - mean_1;
hold on;
plot(t, Channel1, 'Color', 'blue', "LineWidth",0.5);

plot(t, envelope_1, 'color', 'red', "LineWidth", 0.1);
hold off;
soundsc(envelope_1, fs);
pause(10);

figure(6);
bandwidth2 = ((f >= 43 & f <= 51) | (f <= -43 & f >= -51));
new = bigy .* bandwidth2;
plot(f, new);

figure(7);
mssg2 = bandwidth2 .* fftshift(Y);
Channel2 = ifft(mssg2);
envelope_2 = envelope(Channel2);
mean_2 = mean(envelope_2);
envelope_2 = envelope_2 - mean_2;
hold on;
plot(t, Channel2, 'Color', 'blue', "LineWidth",0.5);
plot(t, envelope_2, 'color', 'red', "LineWidth", 0.1);
hold off;
soundsc(envelope_2, fs)
pause(10);

figure(8);
bandwidth3 = ((f >= 55 & f <= 63) | (f <= -55 & f >= -63));
new = bigy .* bandwidth3;
plot(f, new);
figure(9);
mssg3 = bandwidth3 .* fftshift(Y);
Channel3 = ifft(mssg3);
envelope_3 = envelope(Channel3);
mean_3 = mean(envelope_3);
envelope_3 = envelope_3 - mean_3;
hold on;
plot(t, Channel3, 'Color', 'blue', "LineWidth",0.5);
plot(t, envelope_3, 'color', 'red', "LineWidth", 0.1);
hold off;
soundsc(envelope_3, fs)
pause(10);

figure(10);
bandwidth4 = ((f >= 67 & f <= 75) | (f <= -67 & f >= -75));
new = bigy .* bandwidth4;
plot(f, new);
figure(11);
mssg4 = bandwidth4 .* fftshift(Y);
Channel4 = ifft(mssg4);
envelope_4 = envelope(Channel4);
mean_4 = mean(envelope_4);
envelope_4 = envelope_4 - mean_4;

hold on;
plot(t, Channel4, 'Color', 'blue', "LineWidth",0.5);
plot(t, envelope_4, 'color', 'red', "LineWidth", 0.1);
hold off;
soundsc(envelope_4, fs)


