# AMradioDemodulation
Using a raw AM radio signal supplied by the file radio.mat, I successfully demodulated it to play audio from 4 different channels. 

Upon selecting the desired channel via filtering, an envelope detector function successfully removed the carrier frequency component from the time domain signal which then was put through a DC block (the signal was shifted down by its mean).
