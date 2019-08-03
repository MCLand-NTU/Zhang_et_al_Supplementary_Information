function res = GetAllTrajectories(initialConditions, vol)

% define the cell size to store all the trajectories or time course
% simulations
res = cell(size(initialConditions,1),1);

% Use a loop to calculate all the trajectories or time course simulations
disp('Start calculations ...')
for i = 1:size(initialConditions,1)
    % Show the progress of the calculation 
    disp(i);
    % Calculate the time course simulation according to each initial
    % conditions
    res{i} = GetTrajectory(initialConditions(i,:),vol);
end
