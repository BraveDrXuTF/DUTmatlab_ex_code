clc,clear 
solinit = bvpinit(linspace(0,4,5),[-1 1]);  
sol = bvp4c(@twoode,@twobc,solinit); 
x = linspace(0,4); 
y = deval(sol,x); 
plot(x,y(1,:)) 
function dydx=twoode(x,w)
dydx=[w(2);-abs(w(1))];
end
function res = twobc(wa,wb) 
res = [ wa(1); wb(1) + 2 ];  
end
%怎么加参数？
