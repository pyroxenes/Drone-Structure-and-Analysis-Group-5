function armvprop
% Generate a range of propeller lengths for prediction, extending beyond the last data point
propLengths = linspace(5, 60, 500); 
%transpose proplengths
propLengths = propLengths';
%Calculate minimum arm length using the equation minArmLe;ngths = sqrt(((4/3)*propLength)^2 / 2)
minimumDistance= 4/3 * propLengths;
minArmLengths = sqrt((minimumDistance.^2) / 2) ;

%Graph the minimum length of each quadcopter arm based on any given prop length using the fitted curve
figure;
plot(propLengths, minArmLengths, 'g-', 'LineWidth', 2);
xlabel('Propeller Length (inches)');
ylabel('Minimum Arm Length (inches)');
title('Minimum Arm Length vs. Propeller Length');
grid on;
end