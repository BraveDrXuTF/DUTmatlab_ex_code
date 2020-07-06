num1=[1,3,7,9]
num_other=[5,5]
% code_return=cell(1,240)
for l = 1:4
	temp=num1;
	temp(l)=[];
	temp=[temp,num_other]
	S=perms(temp);
	[m,n]=size(S);
	for h =1:m
		temp2=[num1(l),S(h,:)];
		S1(h,:)=temp2;
	end
	
end
S1