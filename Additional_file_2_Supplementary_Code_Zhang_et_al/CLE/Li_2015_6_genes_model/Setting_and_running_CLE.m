%% Setting_and_running_CLE.m implements the algorithm to calculate the potential landscape, plot the figures in 3D view and Top view, 
% and finally record the time it takes.

%% Author: Xiaomeng Zhang and Ket Hing Chong
% School of Computer Science and Engineering
% Nanyang Technological University
% Singapore
% Email: kething@yahoo.com.sg
% Last revision: 7 Sept 2018


clear all
close all

addpath('../common_code_CLE'); % to access the common MATLAB files
tic

% InitParams;
variableNames = {'P53', 'Mdm2','Oct4','miR145','Zeb','miR200'};

index = [1 5];

% Avogadro's number
nA = 6.023e23;            
global vol;
vol = 1e-20  %vol = 1e-15; less noise 
% when vol is smaller it creates larger noise

range_max = 2;
range_min = 0;

initialRange = [zeros(1,6)+range_min;
                zeros(1,6)+range_max];
            
trajectoryNumber = 100000;

splitNumber = 100;
            
fromInitialCondition = min(initialRange);
toInitialCondition = max(initialRange);

% Get all random initial conditions
for j = 1:length(fromInitialCondition)
%   get each random initial conditions within the state space (in number of molecules)
    res(:,j)=nA*vol*(rand(trajectoryNumber, 1)*(toInitialCondition(j)-fromInitialCondition(j))+fromInitialCondition(j));
end

% set the initial conditions as obtained from above
initialConditions = res;
 
% Call the DrawLandscape function to draw landscape:
DrawLandscape;