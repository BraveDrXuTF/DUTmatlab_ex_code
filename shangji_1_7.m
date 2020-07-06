clc,clear
%% 用tic toc在多次计时时似乎不行
%% 1000的情况未必体现循环对速度的影响
t_n_r=clock;
arr=1:1000;
%不同循环
answer_not_recurrent=sum(1./arr.^2-pi^2/6)
t_n_r_1=clock;
t_n_r=etime(t_n_r_1,t_n_r)

t_r=clock;
%用循环
answer_recurrent=0;
for h=1:1000
    temp=1/h^2-pi^2/6;
    answer_recurrent=answer_recurrent+temp;
end
answer_recurrent
t_r_1=clock;
t_r=etime(t_r_1,t_r)

%% 在10000的情况下再次计时以判断循环对速度的影响
t_n_r10000=clock;
arr=1:10000;
%不同循环
answer_not_recurrent10000=sum(1./arr.^2-pi^2/6)
t_n_r10000_1=clock;
t_n_r10000=etime(t_n_r10000_1,t_n_r10000)


t_r10000=clock;
%用循环
answer_recurrent10000=0;
for h=1:10000
    temp=1/h^2-pi^2/6;
    answer_recurrent10000=answer_recurrent10000+temp;
end
answer_recurrent10000
t_r10000_1=clock;
t_r10000=etime(t_r10000_1,t_r10000)
