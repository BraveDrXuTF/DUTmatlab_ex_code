clc,clear
v=[12 3.4 32 12 43];  
[a n]=max(v)




[a1,n1]=max_zihzi(v)





%%¶ÀÁ¢±àÖÆ³ÌĞò
function [m,index]=max_zihzi(arr)
m=arr(1);
index=1;
for h=2:length(arr)
    if arr(h)>m
        m=arr(h);
        index=h;
    end
end
end
