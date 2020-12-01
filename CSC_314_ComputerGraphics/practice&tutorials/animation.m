%Illustrate animation and movies in Matlab
clear
clc
close all

% Step: 1 Generate Data
t = linspace(0, 2*pi, 100);
x = 5*cos(t);
y = 2*sin(t);
z = t;

% Step: 2 Draw/Render the scenario
figh = figure;

for k=1:length(t)
    %Clear the figure so that we are ploting with a blank figure
    clf % Clear the figure
    
    %Extract the data at the current time
    t_k = t(k);
    x_k = x(k);
    y_k = y(k);
    z_k = z(k);
    
    %Plot the current location of the particle
    plot3(x_k, y_k, z_k, 'go', 'LineWidth', 3, 'MarkerSize', 15)
    
    %Plot the entire trajectory
    hold on
    plot3(x, y, z, 'b-', 'LineWidth', 2)
    
    %Decorate the plot
    grid on
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title(['Particle at t = ', num2str(t_k),' seconds'])
    view([30+20*t_k 35])
    
    % Force Matlab to draw the image at this point
    % drawnow % Render now
    % pause(0.2) % Pause before continuing render
    % movieVector(k) = getframe; % Returns a bitmap (Image values) of the current figure
    movieVector(k) = getframe(figh, [10 10 520 400]); % [The dimensions of the figure]
end

%Step 5: Save the movie
myWriter = VideoWriter('curve', 'MPEG-4');
myWriter.FrameRate = 60;

% Open the VideoWriter object, write the movie, and close the file
open(myWriter);
writeVideo(myWriter, movieVector);
close(myWriter);
