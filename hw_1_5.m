%注意计算的是优弧还是劣弧
clear,clc
A= input('请输入A的经纬度（用二维向量表示,角度制）:');
B= input('请输入B的经纬度（用二维向量表示,角度制）:');
%转化为弧度
A=A.*pi./180;
B=B.*pi./180;
S=acos(cos(A(2))*cos(B(2))*cos(A(1)-B(1))+sin(A(2))*sin(B(2)));
disp(['两点之间球面距离',num2str(S)]);
