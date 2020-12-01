% 3d plotting in matlab
clear
clc
close all

% Vars
% x = [1 2 5];
% y = [2 3 4];
% z = [1 3 0];

t = linspace(0, 6*pi, 30);
x = 3*cos(t);
y = 1*sin(t);
z = 0.01*t.^2;

% plot
figure
plot3(x,y,z)
xlabel('x')
ylabel('y')
zlabel('z')
grid on

% make axis equal to the dimensions of the plot
axis('equal')

%% Scatter
plot3(x,y,z,'mo')

%% 3D surfaces
% patch (Creating a surface)
x = [1 2 5];
y = [2 3 4];
z = [1 3 0];

figure
patch(x, y, z, 'm')

%% Mesh function
x1 = linspace(-pi, pi, 20);
x2 = linspace(-10, 16, 30);

% Call meshgrid to create a cartesian product of x1, x2
[X1, X2] = meshgrid(x1, x2);

% Evaluate the function at these (X1, X2) pairs
Z = cos(X1).*X2;

figure
mesh(X1, X2, Z)
xlabel('x_1')
ylabel('x_2')
zlabel('z = f(x_1, x_2)')
grid on

title('Using the mesh function')

% In the figure when rotating, we can explicitly state the Azmuth and the 
% ... elevation (Viewing angle): Az and El
view([35 30])

%% Surf
figure
surf(X1, X2, Z)
xlabel('x_1')
ylabel('x_2')
zlabel('z = f(x_1, x_2)')
grid on

title('Using the surf function')

% In the figure when rotating, we can explicitly state the Azmuth and the 
% ... elevation (Viewing angle): Az and El
view([35 30])

% Remove the dark line shading
shading interp

% Change the colormap of the plot
%colormap jet  % summer, jet, winter
colormap(jet(10)) % The number is the levels of granularity (Color levels)

% Adds a color bar that acts as a legend for colors
colorbar

%% contour function
figure
contour(X1, X2, Z)
xlabel('x_1')
ylabel('x_2')
zlabel('z = f(x_1, x_2)')
grid on
title('Using the '' contour '' funtion ')

%% surfc function (Combines contour and surf function)
figure
surfc(X1, X2, Z)
xlabel('x_1')
ylabel('x_2')
zlabel('z = f(x_1, x_2)')
grid on

title('Using the surfc function')

% Remove the dark line shading
shading interp

% Change the colormap of the plot
%colormap jet  % summer, jet, winter
colormap(jet(10)) % The number is the levels of granularity (Color levels)

% Adds a color bar that acts as a legend for colors
colorbar

