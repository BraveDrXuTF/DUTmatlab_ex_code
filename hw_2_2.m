tspan=[0,50];
y0=[1;1;0];
[T,c]=ode45(@ff,tspan,y0,[],0.01,0.01,0.01)	
plot(T,c(:,1),'y')
hold on
plot(T,c(:,2),'m')
hold on
plot(T,c(:,3),'c')
legend('c1','c2','c3')
saveas(gcf,'hw_2_2.jpg');
function u=ff(x,c,k1,k2,k3)
	u=[k1-k3*c(1)*c(3);k2*c(2)*c(3);k1*c(1)+k3*c(1)*c(3)+k2*c(2)*c(3)];
end