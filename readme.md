基础功能

通过信噪比滑条，增益滑条产生信噪比和增益的值，以及按钮（坐标row,col）决定的频率，产生一个信号，发送端显示该信号的时域图与频域图

接收端需要对信号进分析判定来确认你按得什么按钮，而非直接检测按了什么按钮。

信号由两部分组成，低频区域与高频区域。低频与高频由按钮坐标确定，特定信号只会有特定一个低频和一个高频的组合。因此可以通过检测这个组合来确定是什么按钮，也就是获取该信号的两个频率。

row坐标决定低频为697 770 852 941中的一个

col坐标决定高频为1209 1336 1477 1633中的一个

知道了该信号包含了哪两个频率，就能反推发送的什么号码

发送的信号在经过接受函数后转为了戈泽尔算法的数据，本质是个三维数据了，坐标为每个频点(f)的时域图(p,t)。

采用戈泽尔算法，我们只使用了八个频率，因此只需要八个频点。也就是戈泽尔图可以告诉你这个信号在这八个频点上的强度。

该程序采用如下实现方法：

![电脑的屏幕 描述已自动生成](media/d389c6c04c4cdc14440ffdc9855c2f29.png)

接收端八个图左上到右下分别展示了接受到的信号进行处理后在各个频点的时域图，频率为

697 770

852 941

1209 1336

1477 1633

。则通过检测哪些频点有明显信号则可以推断出播送的号码。例如本图，697和1209的频点信号比较强烈，则可以推断出拨号为1.

判定信号强烈与否比较简单，直接获取某一个图的信号最大值，如果大于阈值则判定为有效，反之无效。代码为：

[最大值,\~] = max(信号)

还是该图举例697和1209的最大值大于阈值107.81（可调节），其余的小于107.81，则697,1209有效，其余无效，反推号码1

如果处于信噪比较小/阈值太低、高/信号强度太低。

可能有如下情况

1.  所有的信号都没达到阈值（这个比较极端）

    ![电脑的屏幕 中度可信度描述已自动生成](media/5f5d5b7057ea4305e80c3ab8efe47f42.png)

2.  超过两个信号到达阈值

    ![电脑的截图 中度可信度描述已自动生成](media/2acde6cef0ad1088180e2adb1ea59f29.png)

则难以反推拨号，用X替代，告知用户发生错误。

Matlab没有直接往框里添加元素的功能，只能整个替代。也就是按下1显示1，再按下2显示2，而不是12。因此我们需要手动制作一个12然后整个替换掉1。

方法就是创建一个数组A，起始状态是空的,然后按下按键返回的字符串我这里起名为W（按下1，W = 1，按下3 ,W = 3）。

则A = [A,W];该赋值在123456789等输入按钮下触发。

意思是每一次按下这些键，获取一个W值，添加到A组里然后更新A组。然后让方框显示A就行

举例，开始A = []%为空

按下1则W = 1 则A = [1]，显示1

接着按下2，则W =2 则 A = [A,W] = [1 2],显示12

以此类推

最终实现显示一整串的功能

进阶功能

1.  各种清零按钮本身很简单，如果对象是个单数值，则直接赋值0，因此增益建议使用db而不是直接倍数。但是最后处理信号时增益需要换算回倍数再相乘。

如果是一个数组，则赋值为空数组。

如果包含波形，则直接让其显示y = 0

有一小点需要注意就是前后端匹配。

例如此处，（清除不是删除，删除指删除最后一个元素）

![图形用户界面, 文本, 应用程序 描述已自动生成](media/034b045afa8fb47770c5d7623af70f9c.png)

输入114514，该数被存入数组A，A被映射到方框里（触发器是123456等按键，因为你一按按键上面框就会记录数字）；点击清除后A会被赋值为空，但是A没有被映射到框里，框还是114514，就出现了前端是114514后端是空的问题，因此还需要在清除按钮下单独添加将框置空或者将A映射的命令。

2.删除按钮，

删除只针对数组最后一个元素。原理很简单，选择数组最后一个元素并置为空,代码为end

例如A = [1 1 4 5 1 4];

A(end) = [];

这时，A = [1 1 4 5 1];

然后记得前后端匹配，将A映射到框。

1.  整组发送与逐个解码，既然需要整组发送，就需要创建一个组，这个组包含了我输入的一堆信号（接收端接受的是信号，不是按钮字符串）。

我们假设这个组是SG

我输入的信号是S

采用类似于显示一整串数的方式进行打组。不过由于信号本身就是二维的，因此这个组合是三维的，稍微有些区别。

SG = [SG;S];(不是SG=[SG,S]);

意思是一行一个信号从上往下摞，大概这么个意思

![图示, 折线图 描述已自动生成](media/f94790a25c9aa3a6be708a270f7ab46d.png)

绿色是第一个信号，黄色第二个，总共有几个取决于输入，并非只有四个。

然后我们可以把这个SG组发送过去。接收端虽然接收到了，但由于接受函数只能接受一个信号，因此需要逐个读取处理。

这里按照常识，使用的队列而不是堆栈，首先输入的自然应该被首先处理。比如输入114514就应该处理为114514而不是415411.

读取数组方式比较简单，使用

X = G(n)

X是读取出的数据，G表示组，n表示第几个。这里由于是三维数组不能说第几个，应该说第几行，代码稍有区别：

X = G(n,:)。

能读取了下面就是处理（判定显示波形啥的），这里和之前单个一样，不解释了。整个流程为

接受信号组

读取第一行，戈泽尔接收第一行，处理第一行

读取第二行，戈泽尔接收第二行，处理第二行

读取第三行，戈泽尔接收第三行，处理第三行

…….

可见是一个循环处理，直接使用for循环即可，循环次数就是这个信号组有多少个信号（也就是多少行）

这样就能把该信号组的信号逐个分析处理。

因此删除清除按钮还负责了信号组的处理，需要把信号组最后一个或者整个删除

不然会出现输入123删去3改为4，框里显示124结果传输的信号数据是1234的问题

![](media/1d220f6483f2647900d73000703768de.png)
