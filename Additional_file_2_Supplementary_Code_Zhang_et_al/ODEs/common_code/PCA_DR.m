function [res,XMin,XMax,YMin,YMax] = PCA_DR(allTrajectories)
% splice all trajectories into a feature matrix
trajNum=size(allTrajectories, 1);
timeNum=size(allTrajectories{1}, 1);
geneNum=size(allTrajectories{1}, 2);
featureMtx=zeros(trajNum*timeNum,geneNum);
pointer=1;
for i = 1:trajNum % each trajectory
    for j=1:timeNum
        featureMtx(pointer,:)=allTrajectories{i}(j,:);
        pointer=pointer+1;
    end
end
% apply other dr methods on feature matrix
% PCA
% [pc,score,latent,tsquare]=pca(featureMtx);
% precision=cumsum(latent)./sum(latent);
% fprintf('The precision of only using first two components is: %0.2f\r',precision(2));
% res=score(:,1:2);
% XMin=min(score(:,1));
% XMax=max(score(:,1));
% YMin=min(score(:,2));
% YMax=max(score(:,2));

[res,precision]=myPCA(featureMtx,'corr');
fprintf('The precision of only using first two components is: %0.2f\r',precision);
XMin=min(res(:,1));
XMax=max(res(:,1));
YMin=min(res(:,2));
YMax=max(res(:,2));
