%hw1-2
clc,clear
x=0;
%��һ�γ���
for h = 1:10000
    x(h+1)=x(h)^2+0.25;
end
u=1:5:201;
answer1_for=x(u);
for t=1:length(answer1_for)
	disp(['for��ѭ����� ',num2str(answer1_for(t))]);
end
%�����ۣ�x������0.5��ʵ����x(10001)=0.499900109673400,�ǳ��ӽ�������


h1=1;
x1=0;
while h1<=10000
	x1(h1+1)=x1(h1)^2+0.25;
	h1=h1+1;
end
answer1_while=x1(u);
t=1;
while t<=length(answer1_while)
	disp(['while��ѭ����� ',num2str(answer1_while(t))]);
    t=t+1;
end

%��Ŀ������������ƽ������ͼ��ָx^2���±������ͼ����x��x^2��ϵ��ͼ�أ������Ҷ�����
figure(1)
plot(x.^2,'ks')
figure(2)
plot(x,x.^2,'ks')
figure(3)
plot(x,'ks')