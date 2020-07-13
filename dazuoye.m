clc,clear
p0=1.013e5;
T0=298;
y0=[0;0;p0;T0];
% t_span=[0,0.5*1e-3];
% p1=10e5;
% t_span=[0,1];
% p1=30e5;
t_span=[0,1];
p1=30e5;
T1=298;

T2=298;%出口温度 
p2=1.013e5;%出口压强 

Mf=0.01;%阀芯质量 
ks=4350;%弹簧刚度系数 
z0=0.0062;%阀芯预压量 
c=20;%阻尼系数 
 
%阀腔和孔板参数
V0=569e-8;%阀腔初始体积 
Din=0.0081;%入口直径 
Sin=pi*Din^2/4;%入口面积,姑且把Sin同时看成进口面积和压强作用的面积 
Dout=0.0078;%孔板出口直径 
Sout=pi*Dout^2/4;%孔板出口面积 
 
%进出口流量系数 
Cq_1= 0.72;%进口流量系数 
Cq_2= 0.85;%出口孔板流量系数 
 
%气体参数 
R=8314; %对的，在用Mr计算时就是这样
Mr=4;
k =1.67;%氦气性质 
% Mr=28.97;k =1.4;%空气性质 
% Mr=28;k =1.4;%氮气性质 
Rg=R/Mr;%气体常数 
cp=Rg*k/(k-1);%等压比热 

%由pV=nRT,得 pV=mRT/M,得出m= pVM/RT＝（p×V×M）÷[8.314×（273.15+t℃）] m为质量 单位Kg p为气体压强 单位Pa V为气体体积 单位m?. M为气体摩尔质量 t为气体温度 单位℃ 你必须知道该气体是什么气体,或者知道它的密度方可计算其质量.
 

 


[tsol,ysol]=ode45(@ff,t_span,y0,[],Mf,c,ks,k,z0,Rg,T1,p1,T2,p2,Cq_1,Cq_2,Sin,Sout,Sin,cp,V0,Mr,R);


figure
plot(tsol,ysol(:,1))





% function df=ff(t,y,M,c,ks,k,z0,Rg,T1,p1,T2,p2,Cq1,Cq2,Ad1,Ad2,Si,cp,V0,Mr,R)
% 	df=[y(2);(Fp(y(3),p1,Si)-c*y(2)-ks*(y(1)+z0))/(M);k*((Rg*T1/V(y(1),V0,Si))*(Ad1*Cq1*Cm1(y(3),k,Rg,p1)*(p1/sqrt(T1)))-(Rg*y(4)/V(y(1),V0,Si))*(Ad2*Cq2*Cm2(y(3),k,Rg,p2)*(y(3)/sqrt(y(4))))+(y(3)/V(y(1),V0,Si))*Si*y(1));(cp*(T1-y(4))*(Ad1*Cq1*Cm1(y(3),k,Rg,p1)*(p1/sqrt(T1)))+y(2)*y(3)*Si+Rg*y(4)*(Ad1*Cq1*Cm1(y(3),k,Rg,p1)*(p1/sqrt(T1))-Ad2*Cq2*Cm2(y(3),k,Rg,p2)*(y(3)/sqrt(y(4)))))/(m(y(3),y(4),V(y(1),V0,Si),Mr,R)*(cp-Rg))];
% 
% 	disp(['合力',num2str(Fp(y(3),p1,Si)-c*y(2)-ks*(y(1)+z0))])
% 	disp(['V',num2str(V(y(1),V0,Si))])
% 	function f=Cm1(p,k,Rg,p1)
% 		f=((p/p1)>(2/(k+1))^(k/(k-1)))*sqrt((2*k/(Rg*(k-1)))*((p/p1)^(2/k)-(p/p1)^((k+1)/k)))+((p/p1)<=(2/(k+1))^(k/(k-1)))*sqrt((k/Rg)*((2/(k+1))^((k+1)/(k-1))));
% 	end
% 	function f=Cm2(p,k,Rg,p2)
% 		f=((p2/p)>(2/(k+1))^(k/(k-1)))*sqrt((2*k/(Rg*(k-1)))*((p2/p)^(2/k)-(p2/p)^((k+1)/k)))+((p2/p)<=(2/(k+1))^(k/(k-1)))*sqrt((k/Rg)*((2/(k+1))^((k+1)/(k-1))));
% 	end
% 	function f=V(z,V0,Si)
% 		f=V0-Si*z;
% 	end
% 	function f=m(p,T,V,Mr,R)
% 		f=p*V*Mr/(R*T);
% 	end
% 	function f=Fp(p,p1,Si)
% 		f=(p1-p)*Si;
% 	end
% end




function df=ff(t,y,M,c,ks,k,z0,Rg,T1,p1,T2,p2,Cq1,Cq2,Ad1,Ad2,Si,cp,V0,Mr,R)

	m_1=Ad1*Cq1*Cm1(y(3),p1,k,Rg)*p1/sqrt(T1);

	m_2=Ad2*Cq2*Cm2(y(3),p2,k,Rg)*y(3)/sqrt(y(4));

	% df=[y(2);(Fp(y(3),p1,Si)-c*y(2)-k*(y(1)+z0))/M;k*(Rg*(T1*Ad1*Cq1*Cm1(y(3),p1,k,Rg)*p1/sqrt(T1)-y(4)*Ad2*Cq2*Cm2(y(3),p2,k,Rg)*y(3)/sqrt(y(4)))+y(3)*y(2)*Si)/V(y(1),V0,Si);(cp*Ad1*Cq1*Cm1(y(3),p1,k,Rg)*p1/sqrt(T1)*(T1-y(4))+y(3)*y(2)*Si+Rg*y(4)*(Ad1*Cq1*Cm1(y(3),p1,k,Rg)*p1/sqrt(T1)-Ad2*Cq2*Cm2(y(3),p2,k,Rg)*y(3)/sqrt(y(4))))/(m(y(3),y(4),V(y(1),V0,Si),Mr,R)*(cp-Rg))];
	df=[y(2);(Fp(y(3),p1,Si)-c*y(2)-ks*(y(1)+z0))/M;k*(Rg*(T1*m_1-y(4)*m_2)+y(3)*y(2)*Si)/V(y(1),V0,Si);(cp*m_1*(T1-y(4))+y(3)*y(2)*Si+Rg*y(4)*(m_1-m_2))/(m(y(3),y(4),V(y(1),V0,Si),Mr,R)*(cp-Rg))];

	% Fp: function description
	function [outputs] = Fp(p,p1,Si)
		outputs = (p1-p)*Si;
	end
	% Cm1: function description
	function [outputs] = Cm1(p,p1,k,Rg)
		Q=p/p1;
		Pcr=(2/(k+1))^(k/(k-1));
		outputs = (Q>Pcr)*sqrt(2*k*(Q^(2/k)-Q^((k+1)/k))/(Rg*(k-1)))+(Q<=Pcr)*sqrt(k*(2/(k+1))^((k+1)/(k-1))/Rg);
	end
	% Cm2: function description
	function [outputs] = Cm2(p,p2,k,Rg)
		Q=p2/p;
		Pcr=(2/(k+1))^(k/(k-1));
		outputs = (Q>Pcr)*sqrt(2*k*(Q^(2/k)-Q^((k+1)/k))/(Rg*(k-1)))+(Q<=Pcr)*sqrt(k*(2/(k+1))^((k+1)/(k-1))/Rg);
	end
	% V: function description
	function [outputs] = V(z,V0,Si)
		outputs = V0-Si*z;
	end
	% m: function description
	function f=m(p,T,V,Mr,R)
		f=p*V*Mr/(R*T);

    end
end

