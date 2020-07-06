clc,clear
field1 = 'name';  value1 = {'liu','wang','zhao'};
field2 = 'age';  value2 = {'17','16','18'};
field3 = 'chinese';  value3 = {'95','98','94'};
field4 = 'math';  value4 = {'100','95','99'};

s = struct(field1,value1,field2,value2,field3,value3,field4,value4)


liu={'liu';17;95;100};
wang={'wang';16;98;95};
zhao={'zhao';18;94;99};
s1={liu,wang,zhao};


%% 访问liu的姓名
liu_name=liu{1}
liu_name2=s(1).name
%% 给zhao添加英语成绩
s(3).english='100';
% 这里是要取内容
s1{3}{5,1}=100;
%% 删除wang的语文成绩
s(2).chinese=[];
s1{2}{3,1}=[];
