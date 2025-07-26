function thrustvproplen
%Use MATLAB to generate a slope of thrust provided by diffrent length of propelors using a non linear dataset
%Data from https://database.tytorobotics.com/motors/3gn/xoar-ta110-20-kv80
%Using a Xoar TA110-20 KV80 motor
lengths = [0,24,36,40,47];
% Define thrust values corresponding to the propeller lengths (in kgf)
thrustValues = [0,9.51, 10.9, 18.8, 26.5];
% Convert thrust values from kgf to lbf (1 kgf = 2.20462 lbf)
thrustValues = thrustValues * 2.20462;
% Fit a nonlinear model to the data
fitModel = fit(lengths', thrustValues', 'poly2');
% Generate a range of propeller lengths for prediction, extending beyond the last data point
propLengths = linspace(5, 60, 500); 
%transpose proplengths
propLengths = propLengths'; % Transpose propLengths to ensure correct dimensions for calculations
predictedThrust = feval(fitModel, propLengths);
% Plot the original data and the fitted curve
figure;
scatter(lengths, thrustValues, 'filled', 'MarkerFaceColor', 'b');
hold on;
plot(propLengths, predictedThrust, 'r-', 'LineWidth', 2);
xlabel('Propeller Length (inches)');
ylabel('Thrust (lbf)');
title('Thrust vs. Propeller Length');
legend('Data Points', 'Fitted Curve');
grid on;
end