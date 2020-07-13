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

T2=298;%�����¶� 
p2=1.013e5;%����ѹǿ 

Mf=0.01;%��о���� 
ks=4350;%���ɸն�ϵ�� 
z0=0.0062;%��оԤѹ�� 
c=20;%����ϵ�� 
 
%��ǻ�Ϳװ����
V0=569e-8;%��ǻ��ʼ��� 
Din=0.0081;%���ֱ�� 
Sin=pi*Din^2/4;%������,���Ұ�Sinͬʱ���ɽ��������ѹǿ���õ���� 
Dout=0.0078;%�װ����ֱ�� 
Sout=pi*Dout^2/4;%�װ������� 
 
%����������ϵ�� 
Cq_1= 0.72;%��������ϵ�� 
Cq_2= 0.85;%���ڿװ�����ϵ�� 
 
%������� 
R=8314; %�Եģ�����Mr����ʱ��������
Mr=4;
k =1.67;%�������� 
% Mr=28.97;k =1.4;%�������� 
% Mr=28;k =1.4;%�������� 
Rg=R/Mr;%���峣�� 
cp=Rg*k/(k-1);%��ѹ���� 

%��pV=nRT,�� pV=mRT/M,�ó�m= pVM/RT����p��V��M����[8.314����273.15+t�棩] mΪ���� ��λKg pΪ����ѹǿ ��λPa VΪ������� ��λm?. MΪ����Ħ������ tΪ�����¶� ��λ�� �����֪����������ʲô����,����֪�������ܶȷ��ɼ���������.
 

 


[tsol,ysol]=ode45(@ff,t_span,y0,[],Mf,c,ks,k,z0,Rg,T1,p1,T2,p2,Cq_1,Cq_2,Sin,Sout,Sin,cp,V0,Mr,R);


figure
plot(tsol,ysol(:,1))





% function df=ff(t,y,M,c,ks,k,z0,Rg,T1,p1,T2,p2,Cq1,Cq2,Ad1,Ad2,Si,cp,V0,Mr,R)
% 	df=[y(2);(Fp(y(3),p1,Si)-c*y(2)-ks*(y(1)+z0))/(M);k*((Rg*T1/V(y(1),V0,Si))*(Ad1*Cq1*Cm1(y(3),k,Rg,p1)*(p1/sqrt(T1)))-(Rg*y(4)/V(y(1),V0,Si))*(Ad2*Cq2*Cm2(y(3),k,Rg,p2)*(y(3)/sqrt(y(4))))+(y(3)/V(y(1),V0,Si))*Si*y(1));(cp*(T1-y(4))*(Ad1*Cq1*Cm1(y(3),k,Rg,p1)*(p1/sqrt(T1)))+y(2)*y(3)*Si+Rg*y(4)*(Ad1*Cq1*Cm1(y(3),k,Rg,p1)*(p1/sqrt(T1))-Ad2*Cq2*Cm2(y(3),k,Rg,p2)*(y(3)/sqrt(y(4)))))/(m(y(3),y(4),V(y(1),V0,Si),Mr,R)*(cp-Rg))];
% 
% 	disp(['����',num2str(Fp(y(3),p1,Si)-c*y(2)-ks*(y(1)+z0))])
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

