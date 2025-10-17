% Define system parameters
m1 = 250;           % Mass 1 (kg)
m2 = 40;            % Mass 2 (kg)
k1 = 1.5e4;         % Spring constant 1 (N/m)
k2 = 1.5e5;         % Spring constant 2 (N/m)
c1 = 1917;          % Damping constant (Ns/m)

% Open a new Simulink model
model = 'TwoMassSuspension';
new_system(model);
open_system(model);

% Block positioning
x = 0; y = 0; dx = 100; dy = 50;

% Input: Ramp function
add_block('simulink/Sources/Ramp', [model '/Ramp'], 'Position', [x y x+50 y+50]);

% Gains for spring and damper constants
add_block('simulink/Math Operations/Gain', [model '/c1'], 'Gain', num2str(c1), 'Position', [x+150 y x+200 y+50]);
add_block('simulink/Math Operations/Gain', [model '/k1'], 'Gain', num2str(k1), 'Position', [x+150 y+100 x+200 y+150]);
add_block('simulink/Math Operations/Gain', [model '/k2'], 'Gain', num2str(k2), 'Position', [x+150 y+200 x+200 y+250]);

% Integrators for x1 and x2 (displacement and velocity)
add_block('simulink/Continuous/Integrator', [model '/x1_dot'], 'Position', [x+300 y x+350 y+50]);
add_block('simulink/Continuous/Integrator', [model '/x1'], 'Position', [x+400 y x+450 y+50]);
add_block('simulink/Continuous/Integrator', [model '/x2_dot'], 'Position', [x+300 y+100 x+350 y+150]);
add_block('simulink/Continuous/Integrator', [model '/x2'], 'Position', [x+400 y+100 x+450 y+150]);

% Sum blocks for forces
add_block('simulink/Math Operations/Sum', [model '/Sum1'], 'Position', [x+500 y x+550 y+50]);
add_block('simulink/Math Operations/Sum', [model '/Sum2'], 'Position', [x+500 y+100 x+550 y+150]);

% Scopes for visualization
add_block('simulink/Sinks/Scope', [model '/x1_Scope'], 'Position', [x+600 y x+650 y+50]);
add_block('simulink/Sinks/Scope', [model '/x2_Scope'], 'Position', [x+600 y+100 x+650 y+150]);

% Connections
add_line(model, 'Ramp/1', 'c1/1');
add_line(model, 'c1/1', 'x1_dot/1');
add_line(model, 'x1_dot/1', 'x1/1');
add_line(model, 'x1/1', 'Sum1/1');
add_line(model, 'x2_dot/1', 'x2/1');
add_line(model, 'x2/1', 'Sum2/1');
add_line(model, 'Sum1/1', 'x1_Scope/1');
add_line(model, 'Sum2/1', 'x2_Scope/1');

% Save and run the model
save_system(model);
sim(model);
