function [D0,epsilon,MinPts,pd,dc]=GetParamater(D,CI,pct,mu,Bound)
    D0=D*100;
    D0(:,CI)=D(:,CI);
%%
DS=sort(D0');
MinPts= min(max(round(size(D,1)*pct),Bound(1)),Bound(2));
% MinPts= min(max(round(length(CI)*pct),Bound(1)),Bound(2));
% dmean=mean(DS(2:MinPts,:));
% [aa,bb]=sort(dmean);
%%
% [cc,dd]=hist(DS(MinPts,:));
% % epsilon=cc(1:h)*dd(1:h)'./sum(cc(1:h)) %0.19 21
% epsilon=mean(dd(1:h));
%%
L=DS(MinPts,:);MA=max(L);MI=min(L);
pd=(L-MI)./(MA-MI);% 归一化后的dK*;
epsilon=(MA-MI)*mu+MI;%mean(dd(1:h));
% pd=[];
% dc=[];
% dc=0;
CorePoints=find(L<epsilon);
dc=min(D0(:,CorePoints)');
dc=dc./max(dc);
% plot(sort(L,'descend'),'.'),hold on;
% line([1,length(L)],[epsilon,epsilon],'Color','r')
% xlabel('Points')
% ylabel('k-dist')
% hold off;
