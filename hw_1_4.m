clear,clc
force= input('��������ά��: ') ;
disp(['���Ĵ�С: ' ,num2str(norm(force))]) ;
disp(['���ķ���: Fx=' , num2str(force(1)), ' Fy=' , num2str(force(2)), 'Fz=' ,num2str(force(3)) ]) ;
disp(['��������: cosa =' , num2str(force(1) /norm(force)), 'cos��=' , num2str(force(2) /norm(force) ),' cosy =' , num2str(force(3) /norm(force) ) ]) ;
disp(['��λ����: ' ,num2str(force/norm(force))]) ;
