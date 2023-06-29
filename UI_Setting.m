function UI_Setting(handles,hObject)
R = imread('.\icon\back_r.png');
G = imread('.\icon\back_g.png');
B = imread('.\icon\back_b.png');
W = imread('.\icon\back_w.png');

%拨号按钮
position_P = get(handles.pushbutton26,'Position');
I_P = imread('.\icon\Phone.png');   %读取图片
I_P = imresize(I_P, [position_P(4)*2.85*5, position_P(3)*5]);
set(handles.pushbutton26,'CData',I_P);  %将按钮的背景图片设置成I，美化按钮
guidata(hObject, handles);

%挂断按钮
position_H = get(handles.pushbutton28,'Position');
I_H = imread('.\icon\Hang_up.png');   %读取图片
I_H = imresize(I_H, [position_H(4)*2.85*5, position_H(3)*5]);
set(handles.pushbutton28,'CData',I_H);  %将按钮的背景图片设置成I，美化按钮
guidata(hObject, handles);

%清除按钮
position_WIPE = get(handles.pushbutton25,'Position');
I_WIPE = imread('.\icon\WIPE.png');   %读取图片
I_WIPE = imresize(I_WIPE, [position_WIPE(4)*2.85*5, position_WIPE(3)*5]);
set(handles.pushbutton25,'CData',I_WIPE);  %将按钮的背景图片设置成I，美化按钮
guidata(hObject, handles);

%回退按钮
position_BACKS = get(handles.pushbutton27,'Position');
I_BACKS = imread('.\icon\BackS.png');   %读取图片
I_BACKS = imresize(I_BACKS, [position_BACKS(4)*2.85*5, position_BACKS(3)*5]);
set(handles.pushbutton27,'CData',I_BACKS);  %将按钮的背景图片设置成I，美化按钮
guidata(hObject, handles);

%键盘按钮123456789
I_Button = imread('.\icon\P_button.png');
set(handles.pushbutton5,'CData',I_Button);
set(handles.pushbutton6,'CData',I_Button); 
set(handles.pushbutton7,'CData',I_Button); 
set(handles.pushbutton9,'CData',I_Button); 
set(handles.pushbutton10,'CData',I_Button);  %将按钮的背景图片设置成I，美化按钮
set(handles.pushbutton11,'CData',I_Button);  %将按钮的背景图片设置成I，美化按钮
set(handles.pushbutton13,'CData',I_Button);  %将按钮的背景图片设置成I，美化按钮
set(handles.pushbutton14,'CData',I_Button);  %将按钮的背景图片设置成I，美化按钮
set(handles.pushbutton15,'CData',I_Button);  %将按钮的背景图片设置成I，美化按钮
%键盘按钮其他
I_Button_F = imread('.\icon\P_button_Full.png');
set(handles.pushbutton8,'CData',I_Button_F);  %将按钮的背景图片设置成I，美化按钮
set(handles.pushbutton12,'CData',I_Button_F);  %将按钮的背景图片设置成I，美化按钮
set(handles.pushbutton16,'CData',I_Button_F);  %将按钮的背景图片设置成I，美化按钮
set(handles.pushbutton17,'CData',I_Button_F);  %将按钮的背景图片设置成I，美化按钮
set(handles.pushbutton18,'CData',I_Button_F);  %将按钮的背景图片设置成I，美化按钮
set(handles.pushbutton19,'CData',I_Button_F);  %将按钮的背景图片设置成I，美化按钮
set(handles.pushbutton20,'CData',I_Button_F);  %将按钮的背景图片设置成I，美化按钮


Func_button_big = imread('.\icon\Func_button_big.png');
%滤波器按钮
set(handles.pushbutton30,'CData',Func_button_big);  %将按钮的背景图片设置成I，美化按钮
guidata(hObject, handles);
%滤波器启动指示灯
set(handles.pushbutton29,'CData',G);  %将按钮的背景图片设置成I，美化按钮
guidata(hObject, handles);
%滤波器关闭指示灯
set(handles.pushbutton32,'CData',R);  %将按钮的背景图片设置成I，美化按钮
guidata(hObject, handles);

%自动按钮
set(handles.autobutton,'CData',Func_button_big);  %将按钮的背景图片设置成I，美化按钮
guidata(hObject, handles);
%自动启动指示灯
set(handles.autog,'CData',G);  %将按钮的背景图片设置成I，美化按钮
guidata(hObject, handles);
%自动关闭指示灯
set(handles.autor,'CData',R);  %将按钮的背景图片设置成I，美化按钮
guidata(hObject, handles);

%信号检查按钮
position_SC = get(handles.pushbutton60,'Position');
Func_button_big_SC = imread('.\icon\Func_button_big.png');
Func_button_big_SC = imresize(Func_button_big_SC, [position_SC(4)*2.85*5, position_SC(3)*5]);
set(handles.pushbutton60,'CData',Func_button_big_SC);
guidata(hObject, handles);

%视角切换按钮
position_vc = get(handles.pushbutton61,'Position');
Func_button_big_vc = imread('.\icon\back_b.png');
Func_button_big_vc = imresize(Func_button_big_vc, [position_vc(4)*2.85*5, position_vc(3)*5]);
set(handles.pushbutton61,'CData',Func_button_big_vc);
guidata(hObject, handles);
end

