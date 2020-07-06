%hw1-3
A='SectionName=00-L75X6 Material=Q235'
Str1 ='SectionName\=(\d{2}-\w{5}) Material=(\w{4})';
B = regexp(A,Str1,'tokens');
C = B{1};
D = C{1}
% B=regexp(A,Str1,'match')