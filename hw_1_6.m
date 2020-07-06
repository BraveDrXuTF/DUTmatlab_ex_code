clc,clear
jishu=1:2:100
L=length(jishu)
S=sum(jishu)



A=jishu
B=2:2:100

Answer_1=A+B;
Answer_2=A.*B;
Answer_3=A.\B;
Answer_4=A./B;
Answer_5=A';
Answer_6=Answer_2(11);