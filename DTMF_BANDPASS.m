function [p_signal] = DTMF_BANDPASS(s_signal)
Fs = 8000;%采样率，整个项目都是8000
fl = 600;%带通低频
fh = 1800;%带通高频
N = 50;%阶数
wn = [fl fh]/(Fs/2);%归一化
window = blackman(N+1);%加窗，使用布莱克曼窗
b = fir1(N,wn,window);%零极点参数
p_signal = filter(b,1,s_signal);%滤波并返回输出波形
end