%% Setting_and_running.m implements the algorithm to calculate the potential landscape, plot the figures in 3D view and Top view, 
% and finally record the time it takes.

% Author: Xiaomeng Zhang and Ket Hing Chong
% School of Computer Science and Engineering
% Nanyang Technological University
% Singapore
% Email: kething@yahoo.com.sg
% Last revision: 7 Sept 2018


clear all;
close all;

addpath('../common_code'); % to access the common MATLAB files
% time in clock to record the start time
tic;

% define the variables name using the order as in ODEs equations
% For the example 3, there are 2 variables
variableNames = {'x', 'y'};

range_max=3;
range_min=-3;
% set the range of the space of interest (you can get maximum range from time course simulations)
initialRange = [zeros(1,2)+range_min;    % set the minimum range
               zeros(1,2)+range_max]; % set the maximum range

index = [2 1]; % the index of the two variables of interest to view the phase plane (2 for y and 1 for x)

% t define the numerical integration interval
t = 0:0.1:30; % set the max end time

fromInitialCondition = min(initialRange);
toInitialCondition = max(initialRange);

% set the number of trajectories for time course simulations 
trajectoryNumber = 100000; 

% set the number of grid box size (100 x 100)
splitNumber = 100;

% Call the DrawLandscape function to draw landscape:
DrawLandscape;