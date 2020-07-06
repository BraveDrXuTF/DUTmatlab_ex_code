%% (1) matlab中查询函数的功能与用法的命令是 help,lookfor

%% (2) 分别写出矩阵 A 的左除、点乘、转置的命令 A\b,A.*B,A'

%% (3) Matlab 中常用的逻辑和关系操作符有 
% 逻辑运算符 && & || | ~ xor 
% 关系运算符
%% (4) 在[10,20]区间上生成均匀分布的 3 阶随机矩阵的命令是 
A=10*rand(3)+10
%% (5) 求矩阵 A 的特征值和相应的特征向量的命令是
[vec,val]=eig(A)
 
%% (6)用 Matlab 计算 f(x)=e^x，当 f(x)>1000 时终止计算并给出 f(x)数值 
ex=@(x)exp(x);
h = 0:0.001:1000;
y = ex(h);
ind=find(y>1000,1)
y0=y(ind)


%% （7）sub原来是一个自定义函数。。。可以可以，整的我去安附加工具了
%注意，在两个函数中都要用global关键字修饰，作业题目出错了！
% 结果：x =
% 
%      4    12    20
% 
% 
% y =
% 
%      2     4     6

global x
x=1:2:5; 
y=2:2:6;                 
sub_zidingyi(y)         

x
y



%% （8）题
F1_d=[-2,2,3]';
F2_d=[3,2,4]';
F3_d=[0,-3,0]';
F1_d=F1_d/norm(F1_d);
F2_d=F2_d/norm(F2_d);
F3_d=F3_d/norm(F3_d);
F=50;
F_d=[-3,-2,2]';
F_d=F_d/norm(F_d);
Angle_matrix=[F1_d;F2_d;F3_d];
b=[0;0;200]-F.*F_d;
F_answer=A\b
%% (9)题  本题借助fero找出来了r=3m(脱离临界)对应的时间
% tc =
% 
%           0.32532467724657
y0=[0;1;0];
u=0.2;
 
guess=0.45;
options=optimset('display','off'); 
tc=fzero(@slope,guess,options,u,y0)
[t,y_zhen]=ode45(@zhendong_T9,[0 tc],y0,[],u);
plot(y_zhen(:,1),y_zhen(:,2))
title('2-9图')
saveas(gcf,'shangji2_9.jpg');

%% (10)题
%为简便起见忽略了各微分关系的常数，并规定q=-1,不考虑单位
solinit = bvpinit(linspace(0,1,6),[1 1 1 1]);
str_suoqiu={'挠度','转角','弯矩'};
str_bc={'简支','两段固定','一端固定一端自由'}
for h=1:3%套用不同边界条件
	for t=1:3%分别输出挠度，转角，弯矩
		str1 = ['第',num2str(h),'_',num2str(t),'个图.png']
		eval(['sol = bvp4c(@eqnset,@bcs',num2str(h),',solinit)']); 
		x = linspace(0,1); 
		y = deval(sol,x); 
		figure
		plot(x,y(t,:));
		title([str_bc{h},'的',str_suoqiu{t}]);
		saveas(gcf,str1);
	end
end



%% 诸函数
function dydx=eqnset(x,y)
dydx=[y(2);y(3);y(4);-1];
end
function res = bcs1(ya,yb) 
res = [ya(1);ya(3);yb(1);yb(3)];  
end
function res = bcs2(ya,yb) 
res = [ya(1);ya(2);yb(1);yb(2)];  
end
function res = bcs3(ya,yb) %左端固定，右端自由
res = [ya(1);ya(2);yb(2);yb(3)];  
end


function z=slope(s,u,y0) 
[x,y]=ode45(@zhendong_T9,[0 s],y0,[],u); 
z=y(end,2)-3;
end

function ff=zhendong_T9(x,y,u)
ff=[6;
    y(3);
    -12*u*y(3)+36*y(2)
    ];
end

function sub_zidingyi(z)
global x 
z=3*x; 
x=x+z;
disp(x)
end

