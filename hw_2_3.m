clc,clear
c_d=0.002;
a=pi/4;
v0=600;
g=32.152;
y0=[v0*cos(a);v0*sin(a);0;0];
x_span=[0,1000];
[x,y]=ode45(@ff,x_span,y0,[],c_d,g)
[ly,ny]=size(y)

for h = 1:ly
    if y(h,1)<=v0*1e-6
        error('vx太小致使微分方程组失效，请重新选择求解区间');        
    end
end

yy=y(:,3)';
ind_stop=find(yy<0,1);
plot(x(1:ind_stop-1),y(1:ind_stop-1,3));

saveas(gcf,'hw_2_3.jpg');

options=optimset('display','off');
[xmax,fval]=fminbnd(@missile,0,1000,[],x,yy);
fval=-fval;

xe=fzero(@missle2,1000,[],x,yy);
te=interp1(x,y(:,4),xe)

function y=missile(xx,x,y)
y=-spline(x,y,xx);
end
function u=ff(x,y,c_d,g)
	u=[-c_d*sqrt(y(1)^2+y(2)^2);-(g+c_d*sqrt(y(1)^2+y(2)^2)*y(2))/y(1);y(2)/y(1);1/y(1)];
end
function y=missle2(xx,x,y)
y=interp1(x,y,xx);
end
