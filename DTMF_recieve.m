function [MF_out,identifyed_str]=DTMF_recieve(zz)
frequency_LL=[697 770 852 941];
frequency_HH=[1209 1336 1477 1633];
symbols=['1' '2' '3' 'A' ;'4' '5' '6' 'B' ;'7' '8' '9' 'C';'*' '0' '#' 'D'];
t_symbol=0.1;
f_sample=8000;
t_sample=1/f_sample;
%zzz=bandpass_filter(zz);
zzz=zz;
%delay_r_t = randi([0 30]);
%delay_r = delay_r_t/100;
%pause(delay_r);
%detect signal starting position
NN1=t_symbol/t_sample;
NN2=NN1/2;
MF_out=[];
XX = zeros(1,200000);
YY = zeros(1,200000);
for k=1:4
ss(1)=1;
ss(2)=0;
coef=2*pi*frequency_LL(k)/f_sample;
b0=sin(coef);
a1=2*cos(coef);
for n=3:NN1
ss(n)=a1*ss(n-1)-ss(n-2)+b0 * zzz(n);
end
MF_out=[MF_out;ss];
XX(k)=0;
for tt=1:5
XX(k)=XX(k)+ss(NN2-tt)*ss(NN2-tt);
end
XX(k)
end
for k=1:4
ss(1)=1;
ss(2)=0;
coef=2*pi*frequency_HH(k)/f_sample;
b0=sin(coef);
a1=2*cos(coef);
for n=3:NN1
ss(n)=a1*ss(n-1)-ss(n-2)+b0 * zzz(n);
end
MF_out=[MF_out;ss];
YY(k)=0;
for tt=1:10
YY(k)=YY(k)+ss(NN2-tt)*ss(NN2-tt);
end
end
[xxx,row_r] =max(XX);
[yyy,col_r] = max(YY);
identifyed_str=symbols(row_r,col_r);