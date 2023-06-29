function String_out(handles,strn)
%这个函数是一个功能函数，没有用上返回值，用于显示输出的拨号码

global identifyed_str_out;
identifyed_str_out = [identifyed_str_out,num2str(strn)];
set(handles.edit5,'String',identifyed_str_out);
end
