function My_gui_outbackup(MF_out,handles,identifyed_str,MF_in)
global identifyed_str_Full
global lim_n
k=[18,20,22,24,31,34,38,42];

%输入1
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 1 && maxnl > lim_n %若最大位置在1处且强度高于门限值
    axes(handles.axes3)%选中aexs3
    plot(MF_out(1,:));%绘制MF_out波形图
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 5 && maxnh > lim_n %若最大位置在1处且强度高于门限值
        axes(handles.axes7) %选中aexs7
        plot(MF_out(1,:));%绘制MF_out波形图        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];%建立字符串组，增添的新元素为新的字符串
        set(handles.edit1,'String',identifyed_str_Full);%将字符串组输出在edit1
    else
        axes(handles.axes7)
        plot(0);
    end
else
    axes(handles.axes3)
    plot(0);
end

%输入2
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 1 && maxnl > lim_n
    axes(handles.axes3)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 6 && maxnh > lim_n
        axes(handles.axes8)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes8)
        plot(0);
    end
else
    axes(handles.axes3)
    plot(0);
end

%输入3
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 1 && maxnl > lim_n
    axes(handles.axes3)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 7 && maxnh > lim_n
        axes(handles.axes9)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes9)
        plot(0);
    end
else
    axes(handles.axes3)
    plot(0);
end

%输入A
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 1 && maxnl > lim_n
    axes(handles.axes3)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 8 && maxnh > lim_n
        axes(handles.axes10)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes10)
        plot(0);
    end
else
    axes(handles.axes3)
    plot(0);
end

%输入4
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 2 && maxnl > lim_n
    axes(handles.axes4)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 5 && maxnh > lim_n
        axes(handles.axes7)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes7)
        plot(0);
    end
else
    axes(handles.axes4)
    plot(0);
end

%输入5
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 2 && maxnl > lim_n
    axes(handles.axes4)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 6 && maxnh > lim_n
        axes(handles.axes8)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes8)
        plot(0);
    end
else
    axes(handles.axes4)
    plot(0);
end

%输入6
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 2 && maxnl > lim_n
    axes(handles.axes4)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 7 && maxnh > lim_n
        axes(handles.axes9)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes9)
        plot(0);
    end
else
    axes(handles.axes4)
    plot(0);
end

%输入B
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 2 && maxnl > lim_n
    axes(handles.axes4)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 8 && maxnh > lim_n
        axes(handles.axes10)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes10)
        plot(0);
    end
else
    axes(handles.axes4)
    plot(0);
end

%输入7
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 3 && maxnl > lim_n
    axes(handles.axes5)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 5 && maxnh > lim_n
        axes(handles.axes7)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes7)
        plot(0);
    end
else
    axes(handles.axes5)
    plot(0);
end

%输入8
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 3 && maxnl > lim_n
    axes(handles.axes5)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 6 && maxnh > lim_n
        axes(handles.axes8)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes8)
        plot(0);
    end
else
    axes(handles.axes5)
    plot(0);
end

%输入9
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 3 && maxnl > lim_n
    axes(handles.axes5)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 7 && maxnh > lim_n
        axes(handles.axes9)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes9)
        plot(0);
    end
else
    axes(handles.axes5)
    plot(0);
end


%输入C
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 3 && maxnl > lim_n
    axes(handles.axes5)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 8 && maxnh > lim_n
        axes(handles.axes10)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes10)
        plot(0);
    end
else
    axes(handles.axes5)
    plot(0);
end

%输入*
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 4 && maxnl > lim_n
    axes(handles.axes6)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 5 && maxnh > lim_n
        axes(handles.axes7)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes7)
        plot(0);
    end
else
    axes(handles.axes6)
    plot(0);
end

%输入0
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 4 && maxnl > lim_n
    axes(handles.axes6)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 6 && maxnh > lim_n
        axes(handles.axes8)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes8)
        plot(0);
    end
else
    axes(handles.axes6)
    plot(0);
end

%输入#
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 4 && maxnl > lim_n
    axes(handles.axes6)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 7 && maxnh > lim_n
        axes(handles.axes9)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes9)
        plot(0);
    end
else
    axes(handles.axes6)
    plot(0);
end

%输入D
sig_L = DTMF_LOW_PASS(MF_in);%低通滤波后的
sig_L_g = goertzel(sig_L,k+1);%戈泽尔变换后的
[maxnl,maxfl] = max(abs(sig_L_g));%获取低频最大值maxnl以及最大位置maxfl
if maxfl == 4 && maxnl > lim_n
    axes(handles.axes6)
    plot(MF_out(1,:));
    
    sig_H = DTMF_HIGH_PASS(MF_in);%高通滤波后的
    sig_H_g = goertzel(sig_H,k+1);%戈泽尔变换后的
    [maxnh,maxfh] = max(abs(sig_H_g));%获取低频最大值maxnl以及最大位置maxfl
    if maxfh == 8 && maxnh > lim_n
        axes(handles.axes10)
        plot(MF_out(1,:));        
        identifyed_str_Full = [identifyed_str_Full,identifyed_str];
        set(handles.edit1,'String',identifyed_str_Full);
    else
        axes(handles.axes10)
        plot(0);
    end
else
    axes(handles.axes6)
    plot(0);
end

end

