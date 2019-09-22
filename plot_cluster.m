function  plot_cluster(I1,I2,X,Y,IDX1)
% only plot 7 clusters using 7 colors
% Authors: Xingyu Jiang (jiangx.y@whu.edu.cn)
% Date:    09/2019
interval = 20; SS = 200;
IDX2 = find(IDX1>0);
if length(IDX2)>SS
    temp = IDX2(randperm(length(IDX2),SS));
    id = IDX1.*0;
    id(temp) = IDX1(temp);
    IDX1 = id;
end
% idx0=find(IDX1==0);
idx1 = find(IDX1==1);
idx2 = find(IDX1==2);
idx3 = find(IDX1==3);
idx4 = find(IDX1==4);
idx5 = find(IDX1==5);
idx6 = find(IDX1==6);
idx7 = find(IDX1==7);

WhiteInterval = 255*ones(size(I1,1), interval, 3);
% 
% TruePos=idx2;% b
% FalseNeg=idx1;
% FalsePos=idx3;
cc=[ 0 0.0 0.95
     0.9 0.2 0.0
     0.0 0.9 0.6
     0.9 0.6 0.0
     0.9 0 0.6
     0.6 0.9 0.1
     0.6 0.0 0.9
];
% cc=[ 0 0.0 0.95
%      0.0 0.9 0.6
%      0.9 0.2 0.0
%      0.9 0.6 0.0
%      0.9 0 0.6
%      0.6 0.9 0.1
%      0.6 0.0 0.9
% ];

imagesc(cat(2, I1, WhiteInterval, I2)) ;
hold on ;
%%
% Select1=randperm(length(idx1),SS);
% Select2=randperm(length(idx2),SS);
% Select3=randperm(length(idx3),SS);plot
% line([X(FalsePos(Select3),1)'; Y(FalsePos(Select3),1)'+size(I1,2)+interval], [X(FalsePos(Select3),2)' ;  Y(FalsePos(Select3),2)'],'linewidth', 1, 'color','[0,0.9,0.9]') ;%  [0.8,0.1,0]
% line([X(FalseNeg(Select1),1)'; Y(FalseNeg(Select1),1)'+size(I1,2)+interval], [X(FalseNeg(Select1),2)' ;  Y(FalseNeg(Select1),2)'],'linewidth', 1.2, 'color', cc(1,:)) ;%'g'
% line([X(TruePos(Select2),1)'; Y(TruePos(Select2),1)'+size(I1,2)+interval], [X(TruePos(Select2),2)' ;  Y(TruePos(Select2),2)'],'linewidth', 1, 'color','[0,0.3,0.9]' ) ;%[0,0.5,0.8]
%%
FalseNeg = idx1;
line([X(FalseNeg,1)'; Y(FalseNeg,1)'+size(I1,2)+interval], [X(FalseNeg,2)' ;  Y(FalseNeg,2)'],'linewidth', 1.2, 'color', cc(1,:)) ;%'g'
TruePos = idx2;
line([X(TruePos,1)'; Y(TruePos,1)'+size(I1,2)+interval], [X(TruePos,2)' ;  Y(TruePos,2)'],'linewidth', 1.2, 'color',cc(2,:) ) ;%[0,0.5,0.8]
FalsePos = idx3;
line([X(FalsePos,1)'; Y(FalsePos,1)'+size(I1,2)+interval], [X(FalsePos,2)' ;  Y(FalsePos,2)'],'linewidth', 1.2, 'color',cc(3,:)) ;%  [0.8,0.1,0]
line([X(idx4,1)'; Y(idx4,1)'+size(I1,2)+interval], [X(idx4,2)' ;  Y(idx4,2)'],'linewidth', 1.2, 'color',cc(4,:) ) ;%[0,0.5,0.8]
line([X(idx5,1)'; Y(idx5,1)'+size(I1,2)+interval], [X(idx5,2)' ;  Y(idx5,2)'],'linewidth', 1.2, 'color',cc(5,:) ) ;%[0,0.5,0.8]
line([X(idx6,1)'; Y(idx6,1)'+size(I1,2)+interval], [X(idx6,2)' ;  Y(idx6,2)'],'linewidth', 1.2, 'color',cc(6,:) ) ;%[0,0.5,0.8]
line([X(idx7,1)'; Y(idx7,1)'+size(I1,2)+interval], [X(idx7,2)' ;  Y(idx7,2)'],'linewidth', 1.2, 'color',cc(7,:) ) ;%[0,0.5,0.8]
%%
axis equal ;axis off  ; 
hold off
drawnow;
%%

% k = 0;
% siz = size(I1);
% figure;
% quiver(X(TrueNeg, 1), siz(1)-X(TrueNeg, 2), (Y(TrueNeg, 1)-X(TrueNeg, 1)), (-Y(TrueNeg, 2)+X(TrueNeg, 2)), k, 'k'), hold on
% FalsePos=idx1;
% quiver(X(FalsePos, 1), siz(1)-X(FalsePos, 2), (Y(FalsePos, 1)-X(FalsePos, 1)), (-Y(FalsePos, 2)+X(FalsePos, 2)), k,'color',  cc(1,:),'LineWidth',1.2,'MarkerSize',8), hold on
% FalseNeg=idx2;
% quiver(X(FalseNeg, 1), siz(1)-X(FalseNeg, 2), (Y(FalseNeg, 1)-X(FalseNeg, 1)), (-Y(FalseNeg, 2)+X(FalseNeg, 2)), k, 'color', cc(2,:),'LineWidth',1.2,'MarkerSize',8), hold on
% TruePos=idx3;
% quiver(X(TruePos, 1), siz(1)-X(TruePos, 2), (Y(TruePos, 1)-X(TruePos, 1)), (-Y(TruePos, 2)+X(TruePos, 2)), k,'color', cc(3,:),'LineWidth',1.2,'MarkerSize',8), hold on
% TruePos=idx4;
% quiver(X(TruePos, 1), siz(1)-X(TruePos, 2), (Y(TruePos, 1)-X(TruePos, 1)), (-Y(TruePos, 2)+X(TruePos, 2)), k,'color', cc(4,:),'LineWidth',1.2,'MarkerSize',8), hold on
% TruePos=idx5;
% quiver(X(TruePos, 1), siz(1)-X(TruePos, 2), (Y(TruePos, 1)-X(TruePos, 1)), (-Y(TruePos, 2)+X(TruePos, 2)), k,'color',  cc(5,:),'LineWidth',1.2,'MarkerSize',8), hold on
% TruePos=idx6;
% quiver(X(TruePos, 1), siz(1)-X(TruePos, 2), (Y(TruePos, 1)-X(TruePos, 1)), (-Y(TruePos, 2)+X(TruePos, 2)), k,'color',  cc(6,:),'LineWidth',1.2,'MarkerSize',8), hold on
% TruePos=idx7;
% quiver(X(TruePos, 1), siz(1)-X(TruePos, 2), (Y(TruePos, 1)-X(TruePos, 1)), (-Y(TruePos, 2)+X(TruePos, 2)), k,'color',  cc(7,:),'LineWidth',1.2,'MarkerSize',8), hold on
% axis equal
% axis([0 siz(2) 0 siz(1)]);
% set(gca,'XTick',-2:1:-1)
% set(gca,'YTick',-2:1:-1)