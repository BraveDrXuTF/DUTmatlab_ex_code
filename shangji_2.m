%% (1) matlab�в�ѯ�����Ĺ������÷��������� help,lookfor

%% (2) �ֱ�д������ A ���������ˡ�ת�õ����� A\b,A.*B,A'

%% (3) Matlab �г��õ��߼��͹�ϵ�������� 
% �߼������ && & || | ~ xor 
% ��ϵ�����
%% (4) ��[10,20]���������ɾ��ȷֲ��� 3 ���������������� 
A=10*rand(3)+10
%% (5) ����� A ������ֵ����Ӧ������������������
[vec,val]=eig(A)
 
%% (6)�� Matlab ���� f(x)=e^x���� f(x)>1000 ʱ��ֹ���㲢���� f(x)��ֵ 
ex=@(x)exp(x);
h = 0:0.001:1000;
y = ex(h);
ind=find(y>1000,1)
y0=y(ind)


%% ��7��subԭ����һ���Զ��庯�����������Կ��ԣ�������ȥ�����ӹ�����
%ע�⣬�����������ж�Ҫ��global�ؼ������Σ���ҵ��Ŀ�����ˣ�
% �����x =
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



%% ��8����
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
%% (9)��  �������fero�ҳ�����r=3m(�����ٽ�)��Ӧ��ʱ��
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
title('2-9ͼ')
saveas(gcf,'shangji2_9.jpg');

%% (10)��
%Ϊ�����������˸�΢�ֹ�ϵ�ĳ��������涨q=-1,�����ǵ�λ
solinit = bvpinit(linspace(0,1,6),[1 1 1 1]);
str_suoqiu={'�Ӷ�','ת��','���'};
str_bc={'��֧','���ι̶�','һ�˹̶�һ������'}
for h=1:3%���ò�ͬ�߽�����
	for t=1:3%�ֱ�����Ӷȣ�ת�ǣ����
		str1 = ['��',num2str(h),'_',num2str(t),'��ͼ.png']
		eval(['sol = bvp4c(@eqnset,@bcs',num2str(h),',solinit)']); 
		x = linspace(0,1); 
		y = deval(sol,x); 
		figure
		plot(x,y(t,:));
		title([str_bc{h},'��',str_suoqiu{t}]);
		saveas(gcf,str1);
	end
end



%% ���
function dydx=eqnset(x,y)
dydx=[y(2);y(3);y(4);-1];
end
function res = bcs1(ya,yb) 
res = [ya(1);ya(3);yb(1);yb(3)];  
end
function res = bcs2(ya,yb) 
res = [ya(1);ya(2);yb(1);yb(2)];  
end
function res = bcs3(ya,yb) %��˹̶����Ҷ�����
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

