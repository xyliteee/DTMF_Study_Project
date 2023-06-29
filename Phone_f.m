function Phone_f(handles)
%这个函数是一个功能函数，没有用上返回值，用于拨号按钮的功能实现
%屎山聚集地

global signal_group;%声明全局信号组
global identifyed_str_out;%声明全局准备输出的字符组
global hang_up%声明挂断标识
global identifyed_str_Full;%声明接受信号组
identifyed_str_out = [];%，在按下button26拨号按钮前，该字符组已经展示完毕，可以初始化，为下一次使用做准备
hang_up = 0;%初始化挂断标识，这b玩意太容易卡没了

func_code = get(handles.edit5,'String');%获取拨号用于检查电话号码是否是功能号码

[ve,vFse]=audioread('.\sound\end.mp3');%读取各种音频
[v,vFs]=audioread('hhh.mp3');
[vc,vFsc]=audioread('.\sound\calling.mp3');
[ver,vFser]=audioread('.\sound\error.mp3');
date = datestr(datetime, 'yyyy/mm/dd');%获取日期
time = datestr(datetime, 'HH:MM:ss');%获取时间


if strcmp(func_code,'*#*#4636#*#*') == 1%如果是4636，则返回彩蛋（现实中这个用于网络配置）
    set(handles.edit5,'string','这是一个彩蛋');
    signal_group = [];%初始化信号组，为下一次使用做准备
    set(handles.pushbutton28,'Visible','on');
    
elseif strcmp(func_code,'114514') == 1%哼哼哼啊啊啊啊啊啊
    set(handles.edit5,'string','哼哼哼啊啊啊啊啊啊');
    signal_group = [];%初始化信号组，为下一次使用做准备   
    sound(v,vFs);
    set(handles.pushbutton28,'Visible','on');
    
else%如果是正常号码
    set(handles.popupmenu2,'Visible','off');%隐藏下拉式菜单，算是避免bug
    set(handles.pushbutton28,'Visible','on');%显示挂断按键，毕竟这个时候已经点了拨号
    set(handles.edit5,'String','拨号中...');%显示拨号中
    [hang,~]=size(signal_group);%获取信号组的行数
    
    if hang == 0%如果行等于0，也就是没有东西
        
        set(handles.edit5,'String','输入为空');%显示输入为空
        set(handles.pushbutton28,'Visible','off');
        %初始化信号组
        set(handles.popupmenu2,'Visible','on');%显示下拉式菜单
        
    else%行数不为零
        
        for i = 1:hang %循环与行数等同次数，也就是把信号组遍历完
            
            delay_r_t = randi([0 30]);%生成0-30的随机数
            delay_r = delay_r_t/50;%除以50
            pause(delay_r);%模拟延迟
            signal_single = signal_group(i,:);
            [MF_out,identifyed_str] = DTMF_recieve(signal_single);%对该信号进行DTMF_recieve处理
            My_gui_out(handles,identifyed_str,MF_out);%对处理后的信号进行绘图以及接受码显示处理
        end
        
        identifyed_str_Full = [identifyed_str_Full,';'];%给接受到的电话号码加上;用于区分
        set(handles.edit1,'String',identifyed_str_Full);  
        E_code = get(handles.edit1,'String');%获取接受码的数值
        E_J = contains(E_code,'X');%查找接受码中是否含有'X'（无法解析的信号）
        
        if E_J == 0   %如果没有，进行呼叫，通过修改10或者0.4，等待上限时间可以调整
            Phone_call();%呼叫函数，这个是空的
            sound(vc,vFsc);
            for i = 1:10
                if hang_up == 1%如果主动挂断；因为无法从外部打断for循环，只能在每个循环中加入触发
                    clear sound;
                    sound(ve,vFse);
                    break;
                else
                    set(handles.edit5,'String','等待呼应.');
                    pause(0.4);
                end
                if hang_up == 1
                    clear sound;
                    sound(ve,vFse);
                    break;
                else
                    set(handles.edit5,'String','等待呼应..');
                    pause(0.4);
                end
                if hang_up == 1
                    clear sound;
                    sound(ve,vFse);
                    break;
                else
                    set(handles.edit5,'String','等待呼应...');
                    pause(0.4);
                end
            end
            if hang_up ==1%如果挂断，为什么这里还要判定，因为挂断与不挂断都是结束，但是后续操作不同；前面是为了打断，这里是为了后续处理的区分
                set(handles.edit5,'String','已挂断');
                
                phone_number = identifyed_str_Full(end-hang:1:end-1);%获取最后一次拨打接受到的电话号码
                user_call = [date,'  ',time,'  ',phone_number,'   ','未接通--挂断'];%标注日期时间电话号码状态
                Calling_history = fopen('.\DATA\Calling_history.txt','a');%打开通话记录记事本，并设定在文件最后接着写入
                fprintf(Calling_history,'%s\n',user_call);%写入
                
                signal_group = [];%初始化信号组
                set(handles.popupmenu2,'Visible','on');%显示下拉式菜单
                
            else%如果没挂断，由于没写成功接通，肯定是无人响应
                set(handles.edit5,'String','暂时无人接听');
                [vn,vFsn]=audioread('.\sound\nobody.mp3');
                sound(vn,vFsn);
                
                phone_number = identifyed_str_Full(end-hang:1:end-1);%获取最后一次拨打接受到的电话号码
                user_call = [date,'  ',time,'  ',phone_number,'   ','未接通--无人接听'];
                Calling_history = fopen('.\DATA\Calling_history.txt','a');
                fprintf(Calling_history,'%s\n',user_call);
                
                signal_group = [];%初始化信号组
                set(handles.popupmenu2,'Visible','on');%显示下拉式菜单
            end
            
        else %如果有无法解析的X
            set(handles.edit5,'String','无法解析，指令已终止，请稍后再拨')
            sound(ver,vFser);
            
            phone_number = identifyed_str_Full(end-hang:1:end-1);%获取最后一次拨打接受到的电话号码
            user_call = [date,'  ',time,'  ',phone_number,'   ','未接通--发生错误'];
            Calling_history = fopen('.\DATA\Calling_history.txt','a');
            fprintf(Calling_history,'%s\n',user_call);
            
            signal_group = [];%初始化信号组
            identifyed_str_Full(end:-1:end-hang)=[];%删除最后接受字符串组，毕竟有错，不用留了
            set(handles.edit1,'String',identifyed_str_Full);
            set(handles.popupmenu2,'Visible','on');%显示下拉式菜单
            set(handles.pushbutton28,'Visible','off');
        end
    end
end
end

