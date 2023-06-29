function DTMF_J(handles,MF_out,identifyed_str)
%这个函数是一个功能函数，没有用上返回值，这用于判断该信号的拨号码并做输出

global lim_n
global identifyed_str_Full

%获取低频各频点最大强度
[maxnl1,~] = max(MF_out(1,:));
[maxnl2,~] = max(MF_out(2,:));
[maxnl3,~] = max(MF_out(3,:));
[maxnl4,~] = max(MF_out(4,:));

%获取高频各频点最大强度
[maxnh1,~] = max(MF_out(5,:));
[maxnh2,~] = max(MF_out(6,:));
[maxnh3,~] = max(MF_out(7,:));
[maxnh4,~] = max(MF_out(8,:));

%输入1
if maxnl1 > lim_n && maxnh1 > lim_n && maxnl2 < lim_n && maxnl3 < lim_n && maxnl4 < lim_n && maxnh2 < lim_n && maxnh3 < lim_n && maxnh4 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);

%输入2
elseif maxnl1 > lim_n && maxnh2 > lim_n && maxnl2 < lim_n && maxnl3 < lim_n && maxnl4 < lim_n && maxnh1 < lim_n && maxnh3 < lim_n && maxnh4 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);
    
%输入3
elseif maxnl1 > lim_n && maxnh3 > lim_n && maxnl2 < lim_n && maxnl3 < lim_n && maxnl4 < lim_n && maxnh1 < lim_n && maxnh2 < lim_n && maxnh4 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);
    
%输入A
elseif maxnl1 > lim_n && maxnh4 > lim_n && maxnl2 < lim_n && maxnl3 < lim_n && maxnl4 < lim_n && maxnh1 < lim_n && maxnh3 < lim_n && maxnh2 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);
    
%输入4
elseif maxnl2 > lim_n && maxnh1 > lim_n && maxnl1 < lim_n && maxnl3 < lim_n && maxnl4 < lim_n && maxnh2 < lim_n && maxnh3 < lim_n && maxnh4 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);
    
%输入5
elseif maxnl2 > lim_n && maxnh2 > lim_n && maxnl1 < lim_n && maxnl3 < lim_n && maxnl4 < lim_n && maxnh1 < lim_n && maxnh3 < lim_n && maxnh4 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);
    
%输入6
elseif maxnl2 > lim_n && maxnh3 > lim_n && maxnl1 < lim_n && maxnl3 < lim_n && maxnl4 < lim_n && maxnh1 < lim_n && maxnh2 < lim_n && maxnh4 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);
    
%输入B
elseif maxnl2 > lim_n && maxnh4 > lim_n && maxnl1 < lim_n && maxnl3 < lim_n && maxnl4 < lim_n && maxnh1 < lim_n && maxnh2 < lim_n && maxnh3 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);

%输入7
elseif maxnl3 > lim_n && maxnh1 > lim_n && maxnl1 < lim_n && maxnl2 < lim_n && maxnl4 < lim_n && maxnh4 < lim_n && maxnh2 < lim_n && maxnh3 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);    

%输入8
elseif maxnl3 > lim_n && maxnh2 > lim_n && maxnl1 < lim_n && maxnl2 < lim_n && maxnl4 < lim_n && maxnh4 < lim_n && maxnh1 < lim_n && maxnh3 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);        

%输入9
elseif maxnl3 > lim_n && maxnh3 > lim_n && maxnl1 < lim_n && maxnl2 < lim_n && maxnl4 < lim_n && maxnh4 < lim_n && maxnh1 < lim_n && maxnh2 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full); 

%输入C
elseif maxnl3 > lim_n && maxnh4 > lim_n && maxnl1 < lim_n && maxnl2 < lim_n && maxnl4 < lim_n && maxnh3 < lim_n && maxnh1 < lim_n && maxnh2 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);  
    
%输入*
elseif maxnl4 > lim_n && maxnh1 > lim_n && maxnl1 < lim_n && maxnl2 < lim_n && maxnl1 < lim_n && maxnh3 < lim_n && maxnh4 < lim_n && maxnh2 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);  
    
%输入0
elseif maxnl4 > lim_n && maxnh2 > lim_n && maxnl1 < lim_n && maxnl2 < lim_n && maxnl1 < lim_n && maxnh3 < lim_n && maxnh4 < lim_n && maxnh1 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);  
    
%输入#
elseif maxnl4 > lim_n && maxnh3 > lim_n && maxnl1 < lim_n && maxnl2 < lim_n && maxnl1 < lim_n && maxnh2 < lim_n && maxnh4 < lim_n && maxnh1 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);  
    
%输入D
elseif maxnl4 > lim_n && maxnh4 > lim_n && maxnl1 < lim_n && maxnl2 < lim_n && maxnl1 < lim_n && maxnh2 < lim_n && maxnh3 < lim_n && maxnh1 < lim_n
    identifyed_str_Full = [identifyed_str_Full,identifyed_str];
    set(handles.edit1,'String',identifyed_str_Full);  
    
%无法解析
else
    identifyed_str_Full = [identifyed_str_Full,'X'];
    set(handles.edit1,'String',identifyed_str_Full);  
end


