
% Load the Model
modelName = 'parrotMinidroneCompetition';
load_system(modelName);

% Explore the Top-Level Model
allBlocks = find_system(modelName);
disp(allBlocks);

% Extract Block Parameters
blockName = 'parrotMinidroneCompetition/Flight Commands';  % Example block name
blockParameters = get_param(blockName, 'ObjectParameters');
disp(blockParameters);

% Analyze Signals
lines = get_param(blockName, 'LineHandles');
disp(lines);

% Explore Stateflow Elements (if present)
if sf('is_chart', blockName)
    chart = sf('get', blockName, 'chart.id');
    states = sf('find', chart, 'state.type', 'AND_STATE');
    disp(states);
end

% Check for Model Issues
ModelAdvisor.run(modelName);

% Simulate the Model (optional)
% Make sure you have all necessary configurations set.
% Uncomment the next line if you wish to run the simulation.
% sim(modelName);

% Close the Model
close_system(modelName, 0);

