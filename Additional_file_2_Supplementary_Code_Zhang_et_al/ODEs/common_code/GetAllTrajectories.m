function res = GetAllTrajectories(initialConditions, t)
% Use a loop to calculate all the trajectories or time course simulations
disp('Start calculations ...')
res = cell(size(initialConditions, 1),1); % size(x,1), return the number of rows
for i = 1:size(initialConditions, 1)
    % Show the progress of the calculation 
    disp(i);
    % Calculate the time course simulation according to each initial
    % conditions
    res{i} = GetOneTrajectory(t, initialConditions(i, :)); % only initial conditions for one trajectory (the number of genes)
end
