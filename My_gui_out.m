function My_gui_out(handles,identifyed_str,MF_out)
%这个函数是一个功能函数，没有用上返回值。功能是显示信号在八个频点的时域图。同时执行DTMF_J()函数。


axes(handles.axes3)
plot(MF_out(1,:),'color',[0.1,0.29,0.49]);
ylim([-400 400]);

axes(handles.axes4)
plot(MF_out(2,:),'color',[0.1,0.29,0.49]);
ylim([-400 400]);

axes(handles.axes5)
plot(MF_out(3,:),'color',[0.1,0.29,0.49]);
ylim([-400 400]);

axes(handles.axes6)
plot(MF_out(4,:),'color',[0.1,0.29,0.49]);
ylim([-400 400]);

axes(handles.axes7)
plot(MF_out(5,:),'color',[0.1,0.29,0.49]);
ylim([-400 400]);

axes(handles.axes8)
plot(MF_out(6,:),'color',[0.1,0.29,0.49]);
ylim([-400 400]);

axes(handles.axes9)
plot(MF_out(7,:),'color',[0.1,0.29,0.49]);
ylim([-400 400]);

axes(handles.axes10)
plot(MF_out(8,:),'color',[0.1,0.29,0.49]);
ylim([-400 400]);

axes(handles.axes17)
t = 1:800;
for i = 1:8
xxx = i.* ones(size(t));
plot3(xxx,t,MF_out(i,:));
hold on;
end
view(180,0);
xlim([0 9]);
hold off;

DTMF_J(handles,MF_out,identifyed_str);

end

