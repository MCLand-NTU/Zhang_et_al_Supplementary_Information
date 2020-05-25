function [res,XMin,XMax,YMin,YMax] = GetPositionProbabilities(fromInitialCondition, toInitialCondition, index, splitNumber, allTrajectories, exe_dr)
% This function count the number trajectory in each grid box
% [Add: The range of 2D plane won't change with genes, so keep index(1) and (2)
% genes are ok and only change calcualting possibility part.]

res = zeros(splitNumber, splitNumber); % set the count in each grid to zero

if exe_dr==true
    % Dimensionality reduction
    [new_trajectories,XMin,XMax,YMin,YMax]=PCA_DR(allTrajectories);
    XMin=min(XMin,fromInitialCondition(index(1))); % get union border
    XMax=max(XMax,toInitialCondition(index(1)));
    YMin=min(YMin,fromInitialCondition(index(2)));
    YMax=max(YMax,toInitialCondition(index(2)));
    rowspan = (XMax - XMin)/splitNumber; % define the row_no. from the range of variable 1
    % rowspan
    colspan = (YMax - YMin)/splitNumber; % define the column_no. from the range of variable 2
    % colspan
    for ite = 1:size(new_trajectories, 1) % for all time points
        row = floor((new_trajectories(ite,1) - XMin)/rowspan) + 1;
    %         row
        col = floor((new_trajectories(ite,2) - YMin)/colspan) + 1;
    %       row and col decide which grid the point in

            if (row > 0 && row < splitNumber) && (col > 0 && col < splitNumber)               
                res(row, col) = res(row, col) + 1;
            end
    end

else
    % Non-dimensionality reduction
    XMin=fromInitialCondition(index(1));
    XMax=toInitialCondition(index(1));
    YMin=fromInitialCondition(index(2));
    YMax=toInitialCondition(index(2));
    rowspan = (XMax - XMin)/splitNumber; % define the row_no. from the range of variable 1
    % rowspan
    colspan = (YMax - YMin)/splitNumber; % define the column_no. from the range of variable 2
    % colspan
    
    for i = 1:size(allTrajectories, 1) % for each trajectory
        for j = 1:size(allTrajectories{i}, 1) % for all time points in one trajectory
            row = floor((allTrajectories{i}(j, index(1)) - fromInitialCondition(index(1)))/rowspan) + 1;
    %         row
            col = floor((allTrajectories{i}(j, index(2)) - fromInitialCondition(index(2)))/colspan) + 1;
    %       row and col decide which grid the point in

                if (row > 0 && row < splitNumber) && (col > 0 && col < splitNumber)               
                    res(row, col) = res(row, col) + 1;
                end
        end
    end
    
end

