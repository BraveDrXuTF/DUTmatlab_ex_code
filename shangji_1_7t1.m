%% 在10000的情况下再次计时以判断循环对速度的影响

t_n_r10000=clock;
arr=1:10000;
%不同循环
answer_not_recurrent10000=sum(1./arr.^2-pi^2/6)
t_n_r10000_1=clock;
t_n_r10000=etime(t_n_r10000_1,t_n_r10000)

