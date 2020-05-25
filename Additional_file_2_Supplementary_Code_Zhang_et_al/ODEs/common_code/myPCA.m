function [dr_result,precision] = myPCA(featureX,method)
[observations,variables]=size(featureX);
norm=(featureX-repmat(mean(featureX),observations,1))./repmat(std(featureX),observations,1);
% methods: cov/corr/svd
if strcmp(method,'cov')
    covariance=cov(norm);
    [eig_vec,eig_value]=eig(covariance);
    contribution=diag(eig_value);
    [contribution_sort,index]=sort(contribution,'descend');
    re_eig_vec=eig_vec(:,index);
    precision=(contribution_sort(1)+contribution_sort(2))/sum(contribution_sort);
    dr_result=featureX*re_eig_vec(:,1:2);
elseif strcmp(method,'corr')
    corr=corrcoef(norm);
    [eig_vec,eig_value]=eig(corr);
    contribution=diag(eig_value);
    [contribution_sort,index]=sort(contribution,'descend');
    re_eig_vec=eig_vec(:,index);
    precision=(contribution_sort(1)+contribution_sort(2))/sum(contribution_sort);
    dr_result=featureX*re_eig_vec(:,1:2);
elseif strcmp(method,'svd')
    [U,S,V]=svd(norm);
    contribution=diag(S);
    [contribution_sort,index]=sort(contribution,'descend');
    re_eig_vec=V(:,index);
    precision=(contribution_sort(1)+contribution_sort(2))/sum(contribution_sort);
    dr_result=featureX*re_eig_vec(:,1:2);
end
