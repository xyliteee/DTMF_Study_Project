function [Gain_OC,SNR_dB_OC] = DTMF_OverClock(n,handles)
global SNR_dB
global Gain
Gain_dB = round(10*log10(Gain),2);

if n == 1%启动超频
    Gain_dB = 4;
    Gain_OC = 10^(Gain_dB/10);
    set(handles.slider6,'Value',2);%这里的2只是为了增益标识滑条最大
    set(handles.radiobutton1,'Value',1);%开启超频灯
    set(handles.edit3,'String','OC-4');%指示最大值
    set(handles.edit3,'ForeGroundcolor',[1,0,0]);%增益字体颜色变红
    SNR_dB_OC =  0.9*SNR_dB + 2;%信噪比增益补偿
    set(handles.edit2,'ForeGroundcolor',[1,0,0]);%信噪比字体颜色变红
    set(handles.slider5,'Value',SNR_dB_OC);%这里显示超频额外附加信噪比
    set(handles.edit2,'String',SNR_dB_OC);%信噪比滑条展示   

    
elseif n == 0%关闭超频
    set(handles.slider6,'Value',Gain_dB);%增益滑条还原
    set(handles.radiobutton1,'Value',0);%关闭超频灯
    set(handles.edit3,'String',Gain_dB);%增益显示还原
    set(handles.edit3,'ForeGroundcolor',[0,0,0]);%增益字体颜色还原
    
    set(handles.slider5,'Value',SNR_dB);%信噪比滑条还原
    set(handles.edit2,'String',SNR_dB);%信噪比显示还原
    set(handles.edit2,'ForeGroundcolor',[0,0,0]);%信噪比字体颜色还原

end
end

