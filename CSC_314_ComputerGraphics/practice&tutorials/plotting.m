% Illustrate 2D plotting

clear
clc
close all

% Use 'plot' command to generate a 2D plot
x = linspace(0, 4*pi, 10);
y = x.^2.*sin(x);

% Print the matrix x and y
figure

% Allows multiple plots to be drawn on the same axis
hold on

% Use plot help to get list of available commands
% m-- is magenta dashed.
plot(x, y, 'm--', 'LineWidth', 3)

% Draw new plot
plot(x, y, 'm^', 'MarkerSize', 14, 'LineWidth', 2);

% add labels
xlabel('x (seconds)')
ylabel('y = x^2*sin(x)')

% Turn on the grid
grid on
title(' X vs. t, an example plot ')

% Legend
legend('y', 'y (data points)', 'Location', 'southwest' )

%% Creating a histogram
N = 2000;
numBars = 20; % Number of bars

% Create uniformly distributed data between 1 and N
samplesUniform = rand(1,N);

% create normally distributed data between 1 and N
samplesNormal = randn(1,N);

figure

% Break down the figure into different subplots
subplot(2, 1, 1) % 2 by 1 in the 1st section
histogram(samplesUniform, numBars)

subplot(2, 1, 2) % 2 by 1 in the 2nd section
histogram(samplesNormal, numBars)


%% PlotYY. Use different columns to denote the axis

x2= linspace(0, 5*pi, 20);
y2 = x2.^3.*sin(x2);

figure
hold on
plotyy(x, y, x2, y2)


%% semilogx. X axis as steps of log
figure 
semilogx(x2, y2)
grid on

%% pie
sales = [15 50 30 30 20];

figure
pie(sales)

%% scatter
figure
subplot(2,1,1)
scatter(x,y)

subplot(2,1,2)
plot(x, y, 'b+')


