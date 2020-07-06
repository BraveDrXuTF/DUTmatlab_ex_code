clear,clc
force= input('请输入三维力: ') ;
disp(['力的大小: ' ,num2str(norm(force))]) ;
disp(['力的分量: Fx=' , num2str(force(1)), ' Fy=' , num2str(force(2)), 'Fz=' ,num2str(force(3)) ]) ;
disp(['方向余弦: cosa =' , num2str(force(1) /norm(force)), 'cosβ=' , num2str(force(2) /norm(force) ),' cosy =' , num2str(force(3) /norm(force) ) ]) ;
disp(['单位向量: ' ,num2str(force/norm(force))]) ;
