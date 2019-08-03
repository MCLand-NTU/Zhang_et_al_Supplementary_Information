function res = GetAllInitialConditions(fromInitialCondition, toInitialCondition, trajectoryNumber)

res = zeros(trajectoryNumber, length(fromInitialCondition));
for j = 1:length(fromInitialCondition)
    % Set the initial conditions randomly in the state space
    res(:, j) = rand(trajectoryNumber, 1)*(toInitialCondition(j)-fromInitialCondition(j)) ...
    + fromInitialCondition(j);
end
