%% ��10000��������ٴμ�ʱ���ж�ѭ�����ٶȵ�Ӱ��

t_r10000=clock;
%��ѭ��
answer_recurrent10000=0;
for h=1:1000000
    temp=1/h^2-pi^2/6;
    answer_recurrent10000=answer_recurrent10000+temp;
end
answer_recurrent10000
t_r10000_1=clock;
t_r10000=etime(t_r10000_1,t_r10000)
