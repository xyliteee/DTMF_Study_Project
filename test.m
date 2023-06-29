SNR_dB = -20;
SNR = 10^(SNR_dB);
pe = 1/2*erfc(sqrt(SNR/2));
disp(pe);
