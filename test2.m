SNR_dB = 0;
in_group = [];
dec_group = [];
for i = 1:10000
    in_l = randi(3);
    in_h = randi(3);
    in_signal = generate_DTMF_signal_11(in_l,in_h,0.00);
    in_str = juc(in_l,in_h);

    SNR=power(10,SNR_dB/10);
    sigma=sqrt(1/SNR);
    noise=sigma*randn(1,length(in_signal));
    mix_signal=in_signal + noise;
    [MF_out,dec_str] = DTMF_recieve(mix_signal);
    dec_str = str2double(dec_str);
    in_group = [in_group,in_str];
    dec_group = [dec_group,dec_str];
end
disp('ÊäÈëµÄ');
disp(in_group);

disp('ÒëÂëµÄ');
disp(dec_group);


wong = 0;
for p = 1:10000
    in_d = in_group(p);
    dec_d = dec_group(p);
    if in_d == dec_d
        flag = flag + 1;
    else
        wong = wong + 1;
    end
end
pe = wong/10000;
disp(pe);
in_group = [];
dec_group = [];