% Get a randomized initial conditions for the trajectoryNumber defined
initialConditions = GetAllInitialConditions(fromInitialCondition, toInitialCondition, trajectoryNumber);

allTrajectories = GetAllTrajectories(initialConditions, t);

%%

% Plot 3D view of the potential landscape
figure;

% Get the probability distributions
[positionProbabilities,XMin,XMax,YMin,YMax] = GetPositionProbabilities(fromInitialCondition, toInitialCondition, index, splitNumber, allTrajectories, exe_dr);

% Normalized Probability
normalized_Prob=positionProbabilities./(sum(sum(positionProbabilities))); % each grid points/all points

% U = - ln P
Neg_lnP=-log(normalized_Prob); 

[x y] = meshgrid(linspace(XMin, XMax, splitNumber), ...
    linspace(YMin, YMax, splitNumber));

% plot the 3D view of the potential landscape
surf(x,y,Neg_lnP);

% label the axes
if exe_dr== true
    xlabel('Component 1');
    ylabel('Component 2');
else
    xlabel(variableNames(index(2)));
    ylabel(variableNames(index(1)));
end
zlabel('U')

% set the x and y axes
axis([XMin XMax YMin YMax]);

% 3D view
view(-13,66); 
box on;

% set the color bar 
colormap('jet');colorbar;

% save img
saveas(gcf,'../Results/3D view.fig')
%%

% Plot Top view of the potential landscape
figure;

surf(x,y,Neg_lnP);
if exe_dr== true
    xlabel('Component 1');
    ylabel('Component 2');
else
    xlabel(variableNames(index(2)));
    ylabel(variableNames(index(1)));
end
zlabel('U')

axis([XMin XMax YMin YMax]);

% Top view
view(0,90);
box on;
colormap('jet');colorbar;

% save img
saveas(gcf,'../Results/Top view.fig')

% time: show how long it takes to calculate and plot the landscape
disp('Calculation and plotting finished.')
duration=toc/(60*60);
disp(['It took ' num2str(duration) ' hours'])

