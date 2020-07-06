clc,clear
syms x

b=[]
A=[]
Ak={}
xk={}
function_set={@(x)ones(size(x)),@(x)x,@(x)x.^2,@(x)x.^3};
for point_num=2:4	
	b=[]
	A=[]
	x0=zero_Legend_poly(x,point_num);
    xk{point_num}=x0;
    x0=x0'
	for h=1:point_num
		temp=function_set{h}(x0);
		A=[A;temp];
		b=[b;int(function_set{h}(x),x,-1,1)];		
	end
	Ak{point_num}=double(A\b);
    Ak{point_num}=Ak{point_num}';
end
s1=GaussL_my_zidingyi(@ff,0,1,2,Ak,xk)
s2=GaussL_my_zidingyi(@ff,0.5,1,3,Ak,xk) 

function s=GaussL_my_zidingyi(ff,a,b,n,Ak,xk)
	u=Ak{n};
	x=xk{n};
	t=0.0; 
	for s=1:n 
		y=x(s)*(b-a)*0.5+(a+b)*0.5; 
		t=t+u(s)*feval(ff,y); 
	end 
	s=t*(b-a)*0.5;
end



function y=ff(x) 
y=x*x*exp(x); 
end


% zero_Legend_poly(x,4)
function p = legendre_zidingyi(t,n)
%求勒让德多项式的函数
%计算勒让德多项式中的x^2-1
f = ( t * t - 1)^n;
%对f多项式进行n阶求导
y = diff( f , n);
%求n得阶乘
str = prod(1 : n);
%勒让德多项式的一般表示式
l = (1 / (2^n * str))*y;
%对求出的勒让德多项式进行合并同类项
p = collect(l);
end

function zero_point_set=zero_Legend_poly(x,n)
	x_poly=legendre_zidingyi(x,n)
	x_xishu=sym2poly(x_poly)
	zero_point_set=roots(x_xishu)
end