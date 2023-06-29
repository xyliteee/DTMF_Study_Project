function varargout = untitled(varargin)
%主函数

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

DTMF_INIT();%数据初始化
set(handles.radiobutton1,'Value',0);%默认超频状态关闭
%UI设定
UI_Setting(handles,hObject);%用于UI的设定


if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end



% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

axes(handles.axes1);
cla;

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        plot(rand(5));
    case 2
        plot(sin(1:0.01:25.99));
    case 3
        bar(1:.5:10);
    case 4
        plot(membrane);
    case 5
        surf(peaks);
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB;%定义全局变量SNR_dB用作信噪比
global Gain;%定义全局变量Gain用作增益（线性）
global signal_group;
global F_Func;

ss=G_DTMF_S(1,1,Gain);%用G_DTMF_S函数产生ss信号，坐标1,1，增益为Gain
sound(ss);%播放
[v,vFs]=audioread('.\sound\1.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1/SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;%产生并叠加噪声

if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end

signal_group = [signal_group;zz];

axes(handles.axes1)%选中axes1,
plot(zz,'color',[0.1,0.29,0.49]);%作zz的图
axes(handles.axes2)%选中axes2
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);%作zz fft后的图

String_out(handles,1)




% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(1,2,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\2.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];

axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,2)
%
%


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(1,3,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\3.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,3)
%
%



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(1,4,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\A.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,'A');




% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(2,1,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\4.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,4)






% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(2,2,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\5.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,5)






% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(2,3,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\6.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,6)




% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(2,4,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\B.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,'B')

 




% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(3,1,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\7.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,7)




% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(3,2,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\8.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,8)





% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(3,3,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\9.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,9)





% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(3,4,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\C.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,'C')






% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(4,1,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\星.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,'*')




% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(4,2,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\0.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,0)




% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(4,3,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\井.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,'#')




% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SNR_dB
global Gain;
global signal_group;
global F_Func;

ss=G_DTMF_S(4,4,Gain);
sound(ss);
[v,vFs]=audioread('.\sound\D.mp3');
sound(v,vFs);
SNR=power(10,SNR_dB/10);
signal_amplitude=1;
power_of_signal=1;
sigma=sqrt(1 / SNR);
noise=sigma*randn(1,length(ss));
zz=ss + noise;
if F_Func == 1
    zz = DTMF_BANDPASS(zz);
end
signal_group = [signal_group;zz];
axes(handles.axes1)
plot(zz,'color',[0.1,0.29,0.49])
axes(handles.axes2)
plot(abs(fft(zz)),'color',[0.1,0.29,0.49]);
String_out(handles,'D');






function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider



% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%接收端清除按钮
y = 0;
axes(handles.axes3);
plot(y);
axes(handles.axes4);
plot(y);
axes(handles.axes5);
plot(y);
axes(handles.axes6);
plot(y);
axes(handles.axes7);
plot(y);
axes(handles.axes8);
plot(y);
axes(handles.axes9);
plot(y);
axes(handles.axes10);
plot(y);
axes(handles.axes17);
plot(y);
global identifyed_str_Full;
identifyed_str_Full = [];
set(handles.edit1,'String',identifyed_str_Full);
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over slider2.


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over slider2.

function slider5_Callback(hObject, eventdata, handles)
%信噪比滑条
global SNR_dB
global A_Func
global Gain
SNR_dB = round(get(handles.slider5,'Value'),2);
set(handles.edit2,'String',num2str(SNR_dB));
if A_Func == 1
    if SNR_dB < -10
        Gain_dB = 2;
        Gain = 10^(Gain_dB/10);
        set(handles.slider6,'Value',Gain_dB);
        set(handles.edit3,'String',Gain_dB);
    else
        Gain_dB = (10-3.*SNR_dB)/20;
        Gain = 10^(Gain_dB/10);
        set(handles.slider6,'Value',Gain_dB);
        set(handles.edit3,'String',round(Gain_dB,2));
    end
end

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
%增益滑条
global Gain
global Gain_dB
Gain_dB = round(get(handles.slider6,'Value'),2);
set(handles.edit3,'String',num2str(Gain_dB));
Gain = 10^(Gain_dB/10);

function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
%信噪比归零
global SNR_dB
SNR_dB = 0;
set(handles.slider5,'value',0);
set(handles.edit2,'string','信噪比');


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
%增益归零
global Gain;
global Gain_dB
Gain_dB = 0;
Gain = 1;
set(handles.slider6,'value',0);
set(handles.edit3,'string','增益');


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
%阈值滑条
global lim_n
lim_n = round(get(handles.slider7,'Value'),2);
set(handles.edit4,'string',num2str(lim_n));

function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
%阈值默认
global lim_n;
lim_n = 110;
set(handles.slider7,'value',100);
set(handles.edit4,'string','接收阈值');


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
%初始化，已被抛弃
INIT();



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
%发送端清除
y = 0;
axes(handles.axes1);
plot(y);
axes(handles.axes2);
plot(y);
global identifyed_str_out;
global signal_group;
signal_group = [];
identifyed_str_out = [];
set(handles.edit5,'String',identifyed_str_out);


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
Phone_f(handles);


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
%删除按钮
global signal_group;
global identifyed_str_out;

if isempty(signal_group)
else
    signal_group(end,:) = [];
end

if isempty(identifyed_str_out)
else
    identifyed_str_out(end) = [];
end
set(handles.edit5,'String',identifyed_str_out);


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
global hang_up
hang_up = 1;%1表示挂断
set(handles.pushbutton28,'Visible','off');%隐藏挂断按键,按下挂断后就没了
DTMF_OverClock(0,handles);
clear sound;



% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% 选中第几行的选项，value值就为选中的行数
global signal_group;
[Gain_OC,SNR_dB_OC] = DTMF_OverClock(1,handles);
var = get(handles.popupmenu2,'Value');
set(handles.edit5,'String','紧急呼叫');

switch var
    case 1   
        DTMF_OverClock(0,handles);
    case 2                        % 119
        signal_group = [DTMF_MIX(1,1,Gain_OC,SNR_dB_OC);DTMF_MIX(1,1,Gain_OC,SNR_dB_OC);DTMF_MIX(3,3,Gain_OC,SNR_dB_OC)];
        Phone_f(handles)
    case 3                        % 110
        signal_group = [DTMF_MIX(1,1,Gain_OC,SNR_dB_OC);DTMF_MIX(1,1,Gain_OC,SNR_dB_OC);DTMF_MIX(4,2,Gain_OC,SNR_dB_OC)];
        Phone_f(handles)
    case 4                        % 120
        signal_group = [DTMF_MIX(1,1,Gain_OC,SNR_dB_OC);DTMF_MIX(1,2,Gain_OC,SNR_dB_OC);DTMF_MIX(4,2,Gain_OC,SNR_dB_OC)];
        Phone_f(handles)
    case 5                       % 紧急联系人
        signal_group = [DTMF_MIX(1,1,Gain_OC,SNR_dB_OC);DTMF_MIX(2,2,Gain_OC,SNR_dB_OC);DTMF_MIX(1,2,Gain_OC,SNR_dB_OC); ...
            DTMF_MIX(1,3,Gain_OC,SNR_dB_OC);DTMF_MIX(1,3,Gain_OC,SNR_dB_OC);DTMF_MIX(2,2,Gain_OC,SNR_dB_OC);DTMF_MIX(3,3,Gain_OC,SNR_dB_OC); ...
            DTMF_MIX(2,3,Gain_OC,SNR_dB_OC);DTMF_MIX(1,1,Gain_OC,SNR_dB_OC);DTMF_MIX(1,1,Gain_OC,SNR_dB_OC);DTMF_MIX(3,3,Gain_OC,SNR_dB_OC)];
        %写不下辣
        Phone_f(handles)
DTMF_OverClock(0,handles);
end



% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
set(handles.radiobutton1,'Value',0);
msgbox('你不能手动开启超频模式','警告')


%滤波器的灯
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%滤波器按钮
function pushbutton30_Callback(hObject, eventdata, handles)
global F_Func;
F_Func = F_Func * -1;

if F_Func == 1
    set(handles.pushbutton30,'String','F-ON');
    for i = 1:50
        set(handles.pushbutton30,'Position',[28*i/100 - 28*(i.^2)/10000,13.7,17.6,3]);
        pause(1/500);
    end
else
    set(handles.pushbutton30,'String','F-OFF');
    for i = 1:50
        set(handles.pushbutton30,'Position',[7-(28*i/100 - 28*(i.^2)/10000),13.7,17.6,3]);      
        pause(1/500);
    end
end

%滤波器的灯
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





%自动按钮的灯
function autor_Callback(hObject, eventdata, handles)
% hObject    handle to autor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%自动按钮的灯
function autog_Callback(hObject, eventdata, handles)
% hObject    handle to autog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%自动按钮
function autobutton_Callback(hObject, eventdata, handles)
global A_Func;
global SNR_dB;
global Gain;

A_Func = A_Func * -1;

if A_Func == 1
    set(handles.autobutton,'String','A-ON');
    for i = 1:50
        set(handles.autobutton,'Position',[28*i/100 - 28*(i.^2)/10000,21.142857142857142,17.6,3]);
        pause(1/500);
    end
    
    if SNR_dB < -10
        Gain_dB = 2;
        Gain = 10^(Gain_dB/10);
        set(handles.slider6,'Value',Gain_dB);
        set(handles.edit3,'String',Gain_dB);
    else
        Gain_dB = (10-3.*SNR_dB)/20;
        Gain = 10^(Gain_dB/10);
        set(handles.slider6,'Value',Gain_dB);
        set(handles.edit3,'String',round(Gain_dB,2));
    end
else
     set(handles.autobutton,'String','A-OFF');
     for i = 1:50
        set(handles.autobutton,'Position',[7-(28*i/100 - 28*(i.^2)/10000),21.142857142857142,17.6,3]);
        pause(1/500);
    end
end



% --- Executes on button press in pushbutton60.
function pushbutton60_Callback(hObject, eventdata, handles)
global signal_group;
[hang,~] = size(signal_group);
t = (0:1:799);


figure(5);
subplot(1,2,1);
set(gcf,'position',[250 300 800 300])
for i = 1:hang
xxx = i.* ones(size(t));
plot3(t,signal_group(i,:),xxx);
hold on;
end
hold off;

subplot(1,2,2);
for i = 1:hang
xxx = i.* ones(size(t));
plot3(t,abs(fft(signal_group(i,:))),xxx);
hold on;
end
hold off;


% --- Executes on button press in pushbutton61.
function pushbutton61_Callback(hObject, eventdata, handles)
global V_Func;
V_Func = V_Func * -1;

if V_Func == 1
    set(handles.pushbutton61,'String','β');
    axes(handles.axes17);
    view(135,70);
    for i = 1:50
        set(handles.pushbutton61,'Position',[83.8,12.22-0.0744*i,6,4]);
        pause(1/500);
    end
else
    set(handles.pushbutton61,'String','α');
    axes(handles.axes17);
    view(180,0);
    for i = 1:50
        set(handles.pushbutton61,'Position',[83.8,8.5+0.0744*i,6,4]);
        pause(1/500);
    end
end
