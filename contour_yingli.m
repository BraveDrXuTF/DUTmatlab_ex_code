function wh_drawcontour(x,y,sigma,n)
%��Ӧ���ĵ�ֵ��ͼ������x,yΪ���͵��������sigmax Ϊ��������Ӧ��ֵ�� 
    [C,h]=contour(x,y,sigma,n); set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2); % showtext��textstep��levelstep�Ǹö��������
    hold on 
    colormap default 
    axis equal
    P=500;
    l=1;
    d=50; ? 
    [x,y]=meshgrid(-25:2:25,-25:2:25);

    sigmax=2.*P./(3.14.*l).*((x+d/2).^3./((x+d/2).^2+y.^2).^2+(d/2x).^3./((x-d/2).^2+y.^2).^2-1/d); 