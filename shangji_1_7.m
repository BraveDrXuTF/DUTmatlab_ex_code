clc,clear
%% ��tic toc�ڶ�μ�ʱʱ�ƺ�����
%% 1000�����δ������ѭ�����ٶȵ�Ӱ��
t_n_r=clock;
arr=1:1000;
%��ͬѭ��
answer_not_recurrent=sum(1./arr.^2-pi^2/6)
t_n_r_1=clock;
t_n_r=etime(t_n_r_1,t_n_r)

t_r=clock;
%��ѭ��
answer_recurrent=0;
for h=1:1000
    temp=1/h^2-pi^2/6;
    answer_recurrent=answer_recurrent+temp;
end
answer_recurrent
t_r_1=clock;
t_r=etime(t_r_1,t_r)

%% ��10000��������ٴμ�ʱ���ж�ѭ�����ٶȵ�Ӱ��
t_n_r10000=clock;
arr=1:10000;
%��ͬѭ��
answer_not_recurrent10000=sum(1./arr.^2-pi^2/6)
t_n_r10000_1=clock;
t_n_r10000=etime(t_n_r10000_1,t_n_r10000)


t_r10000=clock;
%��ѭ��
answer_recurrent10000=0;
for h=1:10000
    temp=1/h^2-pi^2/6;
    answer_recurrent10000=answer_recurrent10000+temp;
end
answer_recurrent10000
t_r10000_1=clock;
t_r10000=etime(t_r10000_1,t_r10000)
