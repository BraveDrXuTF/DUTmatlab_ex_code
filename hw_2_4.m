clc,clear
file='162000.txt'
f=fopen(file)
results=textscan(f,'%s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %d %d%c','Delimiter',{'*',','})

answer_zongjie=[results{4},results{5},results{6},results{7},results{8},results{9}];

fclose(f);

fid=fopen('answer.txt','w');
[b1 b2]=size(answer_zongjie);


for i=1:b1
    for j=1:b2
        
       fprintf(fid,'%f\t',answer_zongjie(i,j));
    end

   fprintf(fid,'\n');
end
fclose(fid);

% fid=fopen(['D:\大二资料\theBottomHalf\2020春季学期\matlab\','A.txt'],'w');%写入文件路径
% for h=1:6
%     
%     for jj=1:length(answer_zongjie(:,h))
% 
%         fprintf(fid,'%.4f\r\n',answer_zongjie(jj,h));   %按列输出，若要按行输出：fprintf(fid,'%.4\t',A(jj)); 
% 
%     end
% end

% fclose(fid);








