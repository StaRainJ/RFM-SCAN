% ind=dp_cluster(D,2,0.2);
function [idx,rho,delta]=dp_cluster(dist,pct,gamma_min)
dist=dist./max(dist(:));
[ND,MD]=size(dist);
N=ND*MD;
percent=pct;
[d_l,~]=sort(reshape(dist,[N,1]));

position=round(N*percent/100);
% sda=sort(xx(:,3));
% dc=sda(position);
dc=d_l(position);

for i=1:ND
  rho(i)=0.;
end

for i=1:ND-1
  for j=i+1:ND
     rho(i)=rho(i)+exp(-(dist(i,j)/dc)*(dist(i,j)/dc));
     rho(j)=rho(j)+exp(-(dist(i,j)/dc)*(dist(i,j)/dc));
  end
end

maxd=max(max(dist));

[rho_sorted,ordrho]=sort(rho,'descend');
delta(ordrho(1))=-1.;
nneigh(ordrho(1))=0;

for ii=2:ND
   delta(ordrho(ii))=maxd;
   for jj=1:ii-1
     if(dist(ordrho(ii),ordrho(jj))<delta(ordrho(ii)))
        delta(ordrho(ii))=dist(ordrho(ii),ordrho(jj));
        nneigh(ordrho(ii))=ordrho(jj);
     end
   end
end
delta(ordrho(1))=max(delta(:));

for i=1:ND
  ind(i)=i;
  gamma(i)=rho(i)*delta(i);
end
gamma=gamma./max(gamma);
figure(1),plot(gamma,'.');
NCLUST=0;
for i=1:ND
  cl(i)=-1;
end
for i=1:ND
%   if ( (rho(i)>rhomin) && (delta(i)>deltamin))
  if gamma(i)>gamma_min
     NCLUST=NCLUST+1;
     cl(i)=NCLUST;
     icl(NCLUST)=i;
  end
end
fprintf('NUMBER OF CLUSTERS: %i \n', NCLUST);


for i=1:ND
  if (cl(ordrho(i))==-1)
    cl(ordrho(i))=cl(nneigh(ordrho(i)));
  end
end
%halo
for i=1:ND
  halo(i)=cl(i);
end
% if (NCLUST>1)
%   for i=1:NCLUST
%     bord_rho(i)=0.;
%   end
%   for i=1:ND-1
%     for j=i+1:ND
%       if ((cl(i)~=cl(j))&& (dist(i,j)<=dc))
%         rho_aver=(rho(i)+rho(j))/2.;
%         if (rho_aver>bord_rho(cl(i))) 
%           bord_rho(cl(i))=rho_aver;
%         end
%         if (rho_aver>bord_rho(cl(j))) 
%           bord_rho(cl(j))=rho_aver;
%         end
%       end
%     end
%   end
  for i=1:ND
%     if (rho(i)<bord_rho(cl(i))+0.1)
    if (rho(i)<max(rho).*0.08)
      halo(i)=0;
    end
  end
% end

idx=find(halo>0);

% Y1 = mdscale(dist, 2, 'criterion','metricstress');
% figure,plot(Y1(:,1),Y1(:,2),'.','MarkerSize',2,'MarkerFaceColor','k','MarkerEdgeColor','k');hold on;%Y1为原始样本坐标，dist为距离矩阵
% plot(Y1(idx,1),Y1(idx,2),'r*');hold off;%Y1为原始样本坐标，dist为距离矩阵

%%
% for i=1:NCLUST
%   nc=0;
%   nh=0;
%   for j=1:ND
%     if (cl(j)==i) 
%       nc=nc+1;
%     end
%     if (halo(j)==i) 
%       nh=nh+1;
%     end
%   end
%   fprintf('CLUSTER: %i CENTER: %i ELEMENTS: %i CORE: %i HALO: %i \n', i,icl(i),nc,nh,nc-nh);
% end
