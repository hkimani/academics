function assignment

    % Clear previous figures
    clear
    clc
    close all
    
    % Variables
    viewing_angle = 4;
    azmuth = 40;
    elevation = 20;
    camera_position = [0,0,.5];

    % Configure the figure (Remove unnecessary parts.
    fig = figure(...
        'units','normalized', ...
        'outerposition',[0 0 1 1], ...
        'numbertitle','off', 'name','Family scene', ...
        'color', [.2, .2, .2], ...
        'closerequestfcn', @close_fcn);
    
    % Configure the axis to make it cinematic
    axs = axes( ...
        'projection', 'perspective', ...
        'cameraviewangle', viewing_angle, ...
        'dataaspectratio', [1,1,1], ...
        'visible', 'off');

    % Variables
    program_on  = true;  
    
    % Selecting the color
    % uisetcolor

    % Compound
    patch( ...
        'vertices', 6000*[1 0 0; 1 1 0; 0 1 0; 0 0 0], ...
        'faces', [1 2 3 4], ...                                  
        'facecolor', [0, 0.498, 0]); 
    
    % House design
    height = 100;
    living_room = block(300, 400, height, 200, 120, height, 'y');
    kitchen = block(600, 400, height, 100, 120, height, 'b');
    hall_way = block(450, 850, height, 50, 320, height, 'g');
    bedroom1 = block(250, 650, height, 150, 120, height, 'r');
    bedroom2 = block(250, 970, height, 150, 200, height, 'b');
    master_bedroom = block(650, 780, height, 150, 250, height, 'm');
    store = block(650, 1100, height, 150, 70, height, 'c');
    bathroom = block(450, 1250, height, 350, 70, height, 'w');
    roof = block(400, 800, 220, 500, 600, 10, 'k');
    
    % Compound
    % Farm patch
    farm = farm_patch(1000, 1200, 5, 200, 700, 5, [0.451,0.261,0.267]);
    
    % foot path
    footpath =  block(900, 150, 2, 700, 100, 2, [0.5020    0.5020    0.5020]);
    footpath2 = block(1500, 850, 2, 100, 800, 2, [0.5020    0.5020    0.5020]);
    
    flower()
    
    % Car design
    body = block(1500, 1500, height/2, 50, 100, height/2, 'b');
    bonet = block(1500, 1430, height/4, 50, 100, height/4, 'b');
    
    % Drive way
    driveway = block(2100, 2400, 2, 300, 3600, 2, 'k');
    driveway2 = block(4000, 900, 2, 2200, 300, 2, 'k');
    
    % Road markings
    gap = -300;
    
    % set the road markings for driveway 1
    for index = 1:20
       marking = block(2100, gap, 2, 20, 50, 4, 'w');
       gap = gap + 350;
    end
    
    gap = 2500;
    
    % set the road markings for driveway 2
    for index = 1:11
       marking = block(gap, 900, 2, 20, 50, 4, 'w');
       gap = gap + 350;
    end
    
    % Parked cars
    % .. car 1
    body = block(2400, 1500, height/2, 50, 100, height/2, 'r');
    bonet = block(2400, 1430, height/4, 50, 100, height/4, 'r');
    
    % ... car 2
    body = block(2400, 700, height/2, 50, 100, height/2, 'g');
    bonet = block(2400, 770, height/4, 50, 100, height/4, 'g');
    
    % ... car 3
    body = block(1800, 500, height/2, 50, 100, height/2, 'm');
    bonet = block(1800, 570, height/4, 50, 100, height/4, 'm');
    boot = block(1800, 430, height/4, 50, 100, height/4, 'm');
    
    
    % ---------------------------- School --------------------------------
    
    ground_floor = block(4000, 4000, height, 1000, 1000, height, 'b');
    rooms = block(4000, 3000, height, 1000, 1000, height, 'b');
    rooms = block(4300, 3000, height, 700, 700, height, 'b');
    
    % first floor
    first_floor = block(4000, 4000, 300, 1000, 1000, height, 'y');
    rooms = block(4000, 4000, 300, 500, 500, height, 'y');
    
    % second floor
    first_floor = block(4000, 4000, 500, 1000, 1000, height, 'r');
    rooms = block(4000, 4000, 500, 500, 500, height, 'y');
    
    % School roof
    roof = block(4000, 3600, 600, 1300, 1700, 10, 'k');
    school_foot_path = block(4000, 1550, 2, 200, 450, 2, [0.5020 0.5020 0.5020]);
    
    % ---------------------------- People --------------------------------
    
    % Father
    father_head = block(1500, 3600, 105, 10, 10, 10, 'k');
    father_body = block(1500, 3600, 55, 5, 5, 55, 'k');
    
    % ... Father arms
    shoulders = block(1500, 3600, 75, 30, 5, 5, 'k');
    arm1 = block(1470, 3600, 60, 5, 5, 20, 'k');
    arm2 = block(1530, 3600, 60, 5, 5, 20, 'k');
    
    % Animate the scene
    for index=1:35
       azmuth = azmuth + 10;
       % Viewing angle
       view([azmuth,elevation])
       pause(.1)
       drawnow % Render now
    end
    

    % Zoom in
    for index=1:10
       % camera_position = camera_position + 2;
       % axs.CameraPosition = camera_position;
       % Viewing angle
       pause(.1)
       drawnow % Render now
    end
    
    % Figure window 'close request' function
    function close_fcn(~,~)
        % program_on = false;
        delete(fig);
    end

    % Flower
    function fl = flower(~,~)
        vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
        fac = [1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8;1 2 3 4;5 6 7 8];
        patch(...
        'xdata', 1200,...
        'ydata', 500,...
        'zdata', 10,...
        'facecolor', 'g');
    end

    % Farm
    % Helper function to create the different rooms of the house
    function f = farm_patch(x,y,z,l,w,h,c)                               
        
        vertices = ...
            repmat([x,y,z]',1,8) + [ ...
            -l -l -l -l  l  l  l  l  
            -w -w  w  w -w -w  w  w
            -h  h  h -h -h  h  h -h];
        
        faces = [ ...
            1 5 1 3 1 2; 
            2 6 2 4 4 3;
            3 7 6 8 8 7; 
            4 8 5 7 5 6]';  
    
        f = patch( ...
            'vertices',  vertices', ...
            'faces',     faces,...
            'facecolor', c, ...
            'facealpha', .8);
    end

    % Helper function to create different parts of the environment
    function b = block(x,y,z,l,w,h,c)                               
        
        % Repeat matrices
        vertices = ...
            repmat([x,y,z]',1,8) + [ ...
            -l -l -l -l  l  l  l  l  
            -w -w  w  w -w -w  w  w
            -h  h  h -h -h  h  h -h];
        
        % Define the polygon faces
        faces = [ ...
            1 5 1 3 1 2; 
            2 6 2 4 4 3;
            3 7 6 8 8 7; 
            4 8 5 7 5 6]';  
    
        b = patch( ...
            'vertices',  vertices', ...
            'faces',     faces,...
            'facecolor', c, ...
            'facealpha', .8);
    end

end
