function [dtmf] = G_DTMF_S(row,col,Gain)
frequency_LL=[697 770 852 941];
frequency_HH=[1209 1336 1477 1633];
f_LL=frequency_LL(row);
f_HH=frequency_HH(col);
f_sample=8000;
t_sample=1/8000;
T1=0.05;
T2=0.05;
N1=T1/t_sample;
N2=T2/t_sample;
y1=zeros(1,N1+N2);
y2=zeros(1,N1+N2);
coef1=2*pi*f_LL/f_sample;
a1=2*cos(coef1);
b0=sin(coef1);
y1(1)=b0;
y1(2)=0;
for n=3:N1
y1(n)=a1*y1(n-1)-y1(n-2);
end
coef2=2*pi*f_HH/f_sample;
a2=2*cos(coef2);
b0=sin(coef2);
y2(1)=b0;
y2(2)=0;
for n=3:N1
y2(n)=a2*y2(n-1)-y2(n-2);
end
dtmf=Gain.*(y1+y2);
end
