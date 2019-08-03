function res = GetOneTrajectory(t, initialCondition)
% Calculate the time course simulations using MATLAB built in function ode45 
[T res] = ode45(@equations, t,  initialCondition, []);
