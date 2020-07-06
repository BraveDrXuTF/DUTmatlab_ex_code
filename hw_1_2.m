%hw1-2
clc,clear
x=0;
%第一段程序
for h = 1:10000
    x(h+1)=x(h)^2+0.25;
end
u=1:5:201;
answer1_for=x(u);
for t=1:length(answer1_for)
	disp(['for的循环结果 ',num2str(answer1_for(t))]);
end
%由理论，x收敛于0.5，实际上x(10001)=0.499900109673400,非常接近这个结果


h1=1;
x1=0;
while h1<=10000
	x1(h1+1)=x1(h1)^2+0.25;
	h1=h1+1;
end
answer1_while=x1(u);
t=1;
while t<=length(answer1_while)
	disp(['while的循环结果 ',num2str(answer1_while(t))]);
    t=t+1;
end

%题目描述不清晰，平方曲线图是指x^2随下标增大的图还是x和x^2关系的图呢？这里我都画了
figure(1)
plot(x.^2,'ks')
figure(2)
plot(x,x.^2,'ks')
figure(3)
plot(x,'ks')