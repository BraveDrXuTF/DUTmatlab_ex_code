%% ��10000��������ٴμ�ʱ���ж�ѭ�����ٶȵ�Ӱ��

t_n_r10000=clock;
arr=1:10000;
%��ͬѭ��
answer_not_recurrent10000=sum(1./arr.^2-pi^2/6)
t_n_r10000_1=clock;
t_n_r10000=etime(t_n_r10000_1,t_n_r10000)

