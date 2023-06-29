function DTMF_INIT()
%功能函数，用于初始化
global hang_up
global lim_n;
global SNR_dB;
global Gain;
global Gain_dB;
global identifyed_str_out;
global signal_group;
global identifyed_str_Full;
global F_Func;
global A_Func;
global V_Func;
lim_n = 110;
SNR_dB = 0;
Gain = 1;
Gain_dB = 0;
signal_group = [];
identifyed_str_out = [];
identifyed_str_Full = [];
hang_up = 0;
F_Func = -1;
A_Func = -1;
V_Func = -1;

end

