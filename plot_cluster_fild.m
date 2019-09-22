function  plot_cluster_fild(I1,I2,X,Y,IDX1)
% Authors: Xingyu Jiang (jiangx.y@whu.edu.cn)
% Date:    09/2019

interval = 20; SS=100;
idx0 = find(IDX1==0);
idx1 = find(IDX1==1);
idx2 = find(IDX1==2);
idx3 = find(IDX1==3);
idx4 = find(IDX1==4);
idx5 = find(IDX1==5);
idx6 = find(IDX1==6);
idx7 = find(IDX1==7);

WhiteInterval = 255*ones(size(I1,1), interval, 3);
cc=[ 0 0.0 0.95
     0.9 0.2 0.0
     0.0 0.9 0.6
     0.9 0.6 0.0
     0.9 0 0.6
     0.6 0.9 0.1
     0.6 0.0 0.9];
k   = 0;
siz = size(I1);
figure;
TrueNeg  = idx0;% k
quiver(X(TrueNeg, 1), siz(1)-X(TrueNeg, 2), (Y(TrueNeg, 1)-X(TrueNeg, 1)), (-Y(TrueNeg, 2)+X(TrueNeg, 2)), k, 'k'), hold on
FalsePos = idx1;
quiver(X(FalsePos, 1), siz(1)-X(FalsePos, 2), (Y(FalsePos, 1)-X(FalsePos, 1)), (-Y(FalsePos, 2)+X(FalsePos, 2)), k,'color',  cc(1,:),'LineWidth',1.2,'MarkerSize',8), hold on
FalseNeg = idx2;
quiver(X(FalseNeg, 1), siz(1)-X(FalseNeg, 2), (Y(FalseNeg, 1)-X(FalseNeg, 1)), (-Y(FalseNeg, 2)+X(FalseNeg, 2)), k, 'color', cc(2,:),'LineWidth',1.2,'MarkerSize',8), hold on
TruePos  = idx3;
quiver(X(TruePos, 1), siz(1)-X(TruePos, 2), (Y(TruePos, 1)-X(TruePos, 1)), (-Y(TruePos, 2)+X(TruePos, 2)), k,'color', cc(3,:),'LineWidth',1.2,'MarkerSize',8), hold on
TruePos  = idx4;
quiver(X(TruePos, 1), siz(1)-X(TruePos, 2), (Y(TruePos, 1)-X(TruePos, 1)), (-Y(TruePos, 2)+X(TruePos, 2)), k,'color', cc(4,:),'LineWidth',1.2,'MarkerSize',8), hold on
TruePos  = idx5;
quiver(X(TruePos, 1), siz(1)-X(TruePos, 2), (Y(TruePos, 1)-X(TruePos, 1)), (-Y(TruePos, 2)+X(TruePos, 2)), k,'color',  cc(5,:),'LineWidth',1.2,'MarkerSize',8), hold on
TruePos  = idx6;
quiver(X(TruePos, 1), siz(1)-X(TruePos, 2), (Y(TruePos, 1)-X(TruePos, 1)), (-Y(TruePos, 2)+X(TruePos, 2)), k,'color',  cc(6,:),'LineWidth',1.2,'MarkerSize',8), hold on
TruePos  = idx7;
quiver(X(TruePos, 1), siz(1)-X(TruePos, 2), (Y(TruePos, 1)-X(TruePos, 1)), (-Y(TruePos, 2)+X(TruePos, 2)), k,'color',  cc(7,:),'LineWidth',1.2,'MarkerSize',8), hold on
axis equal
axis([0 siz(2) 0 siz(1)]);
set(gca,'XTick',-2:1:-1)
set(gca,'YTick',-2:1:-1)