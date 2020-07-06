function runoscillation2 
zeta=0.4 ; alpha=0;  %线性 自由振动 
delt=linspace(0,40,1000); 
[t1,x1]=ode45(@freeoscillation,delt,[1 1]',[],zeta,alpha);  
plot(t1,x1(:,1))
alpha=1.5; beta=3.0; F0=50.;  % 非线性 受迫振动 
[t2,x2]=ode45(@forcedoscillation,delt,[0 0]',[],zeta,alpha,beta,F0); 
figure 
plot(t2,x2(:,1))
alpha=0.0; beta=3.0; F0=50; %线性 受迫振动 
[t3,x3]=ode45(@forcedoscillation,delt,[0 0]',[],zeta,alpha,beta,F0); 
figure 
plot(t3,x3(:,1))
function xdot=freeoscillation(t,x,zeta,alpha) 
xdot=[x(2); -2*zeta*x(2)-x(1)-alpha*x(1)^3];  %free oscillation
function xdot=forcedoscillation(t,x,zeta,alpha,omega,X0) 
xdot=[x(2); -2*zeta*x(2)-x(1)-alpha*x(1)^3+X0*cos(omega*t)];  % force oscillation