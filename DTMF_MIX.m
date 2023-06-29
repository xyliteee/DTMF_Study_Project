function [signal_mix] = DTMF_MIX(row,col,Gain,SNR_dB)
%波形产生后处理函数，其实就是加噪音和滤波，用于紧急呼叫那一块，纯粹因为我懒我才写的，不然一改改一堆
ss = G_DTMF_S(row,col,Gain);
SNR=power(10,SNR_dB/10);
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
signal_n=ss + noise;
signal_mix = DTMF_BANDPASS(signal_n);
end

