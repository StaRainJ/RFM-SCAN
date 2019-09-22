%% Matlab code for RPM-SCAN
% This is a demo for removing outliers. In this demo, the SIFT matches  is known in advance.
% Authors: Xingyu Jiang (jiangx.y@whu.edu.cn)
% Date:    09/2019

clear;  
close all;  
%% Load data

img1=imread('church1.jpg');
img2=imread('church2.jpg');
load('churchLPM.mat');  

% img1=imread('fox3.jpg');
% img2=imread('fox2.jpg');
% load('fox32CM.mat');  

if size(img1,3)==1
    img1=repmat(img1,[1 1 3]);
end
if size(img2,3)==1
    img2=repmat(img2,[1 1 3]);
end


%% Parameters Setting
gamma = 10;          % tradeoff in distance calculation : d=1+gama*exp(-min(d1,d2)); small gamma for ratation and scaling
Bound = [3,30];      % constraint the range of MinPts
pct   = 0.05;        % the  rate to choose MinPts: 0.02-0.05
Mu    = [0.1,0.08];  % the  rate to choose epsilon:
%% Add outliers for robustness 
% note: if the inlier rate is high (>90%), the pct and mu are not
% workable, resulting in low recall. So we need add some outliers manually 
N      = size(X,1);
NoiseN = round(min(0.05.*N,20));
NoiseX = [X;rand(NoiseN,2).*repmat(max(X),[NoiseN,1])];
NoiseY = [Y;rand(NoiseN,2).*repmat(max(Y),[NoiseN,1])];
X = NoiseX; Y = NoiseY;

%% Run DBSCAN Clustering Algorithm  
tic
X1 = [X,Y,Y-X];
D  = myDist(X1,gamma);% 20  h=2;
% ******* iteration1 *****
C0 = 1:size(X,1);% CorrectIndex;%
mu = Mu(1);
[D1,epsilon,MinPts] = GetParamater(D,C0,pct,mu,Bound);
[IDX1,~] = DBSCAN(D1,MinPts,epsilon);  
IDX1=IDX1(1:N);
% ******** iteration2 *****
C0 = find( IDX1>0 );  %  CorrectIndex;% 
mu = Mu(2);
[D2,epsilon,MinPts,pd,dc] = GetParamater(D,C0,pct,mu,Bound);
[IDX1,~] = DBSCAN(D2,MinPts,epsilon);
toc
%% 
IDX1=IDX1(1:N);
ind=find(IDX1>0); 
X = X(1:end-NoiseN,:); Y = Y(1:end-NoiseN,:);
%%
disp('********* Parameters *************')
fprintf('epsilon=%.2d \n',epsilon);
fprintf('MinPts=%.2d \n',MinPts);
disp('********* Results ****************')
[inlier_num,inlierRate,precision_rate,Recall_rate] = evaluatePR(X,CorrectIndex,ind);
fprintf('precision_rate=%2.4f\n',precision_rate*100);
fprintf('Recall_rate=%2.4f\n',Recall_rate*100);
disp('********* End ****************')
%% Plot Cluster Results  
figure, Ia = img1;Ib = img2;
plot_cluster(Ia,Ib,X,Y,IDX1);
plot_cluster_fild(Ia,Ib,X,Y,IDX1)
%%
figure,
[FP,FN] = plot_matches(Ia, Ib, X, Y, ind, CorrectIndex);
plot_4c(Ia,Ib,X,Y,ind,CorrectIndex);  
