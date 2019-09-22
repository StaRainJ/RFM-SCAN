function D=myDist(A,gama)
% X2=mapminmax(X',-1,1)';
% Y2=mapminmax(Y',-1,1)';
% Xnew=[cos(X2(:,1).*pi/2),sin(X2(:,1).*pi/2),... x： 第一幅图像中横坐标
%       cos(X2(:,2).*pi/2),sin(X2(:,2).*pi/2)];  %y： 第一幅图像中纵坐标
% Ynew=[cos(Y2(:,1).*pi/2),sin(Y2(:,1).*pi/2),...x'： 第二幅图像中横坐标
%       cos(Y2(:,2).*pi/2),sin(Y2(:,2).*pi/2)]; %y'： 第二幅图像中纵坐标
% d1=pdist2(Xnew,Xnew)./sqrt(8);
% d2=pdist2(Ynew,Ynew)./sqrt(8);
%%
A=mapminmax(A',0,1)'; 
X=A(:,1:2);
Y=A(:,3:4);
vec=A(:,5:6);

d1=pdist2(X,X);
d2=pdist2(Y,Y);

weight=1+gama.*exp(-min(d1,d2));
% weight=weight./(max(max(weight)));
d3=weight.*pdist2(vec,vec);
% c1=bsxfun(@lt,d1,d2);
% weight=1+gama.*exp(-d1.*c1-d2.*(~c1));
% d3=bsxfun(@times,weight,pdist2(vec,vec));
% d3(find(d3>0.00000001&d3<0.005))=100;

% D=weight.*pdist2(A,A);
D=d1+d2+d3;
% vec=Y-X;
% d2=sqrt(vec(:,1).^2+vec(:,2).^2);  % the length of the vector
% sita=atan(vec(:,2)./vec(:,1));% the derection of the vector
% sita(find(sita>=0&vec(:,2)<=0))=sita(find(sita>=0&vec(:,2)<=0))+pi;%3
% sita(find(sita<=0&vec(:,2)<=0))=sita(find(sita<=0&vec(:,2)<=0))+2*pi;%4
% sita(find(sita<=0&vec(:,2)>0))=sita(find(sita<=0&vec(:,2)>0))+pi;%2
% % [sita,L]=cart2pol(vec(:,1),vec(:,2));
% % dsita=abs(sita-sita');
% % temp0=find(dsita>pi);
% % dsita(temp0) = 2*pi-dsita(temp0);
% % % dsita(find(dsita<-pi))= 2*pi+dsita(find(dsita<-pi));
% % % d3=abs(sin(dsita./2));
% % L=L+0.00001;rho=min(L./L',L'./L);
% % d4=1-rho; % L： 向量模长
