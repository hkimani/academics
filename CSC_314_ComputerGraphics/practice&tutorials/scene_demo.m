function scene_demo
    % Set up the camera
    cam_pos = [0,0,.5];
    cam_el = .5; % Camera elevation % .5 radians
    cam_az = .5; % Camera azmuth % .5 radians
    
    % Camera speed set up
    cam_el_speed = 0; % camera elevation speed
    cam_az_speed = 0; % camera azmuth speed
    
    cam_fwd_speed = 0;
    cam_side_speed = 0;
    
    % Anonymous function
    % Projection: [XY plane * X axis, XY plane * Y axis, % Z axis ]
    % ... Returns unit vector as defined by the elevation and asmuth
    unit_vec = @(el,az)[
        cos(el)*cos(az), ...
        cos(el)*sin(az), ...
        sin(el)];

    fig = figure( ...
        'menubar', 'none', ...
        'color', [.2,.2,.2], ...
        'keypressfcn', @key_down, ...
        'keyreleasefcn', @key_up, ...
        'closerequestfcn', @close_fcn);
        % ... Close request function to listen to a close event and handle window closing.
    
    % Callibrate the axis
    ax = axes(...
        'projection', 'perspective', ...
        'cameraviewangle', 60, ...
        'dataaspectratio', [1,1,1], ...
        'visible', 'off');
    
    % Helpful text
    annotation('textbox', ...
        'position', [0,0,1,1], ...
        'edgecolor', 'none', ...
        'color', [.7,.8,.9], ...
        'fontsize', 20, ...
        'interpreter', 'latex', ...
        'string', ...
            {'Configuration: ';
             'move, turn';
             '..e....i..';
             '.sdf..jkl.';});
    
    % ------------------------- Graphics -----------------------
     
    for i = 1:100
       patch(...
        'xdata', 10*rand*[1,1,1] + rand(1,3),...
        'ydata', 10*rand*[1,1,1] + rand(1,3),...
        'zdata', 10*rand*[1,1,1] + rand(1,3),...
        'facecolor', rand(1,3));
    end
    
    % The 'floor' of the animation
    plot_surf = surface(...
        'xdata', linspace(0,20), ...
        'ydata', linspace(0,20), ...
        'zdata', zeros(100,100), ...
        'cdata', rand(100,100, 3), ...
        'facelighting', 'gouraud');
    % cdata: color data 
    
    % lights
    % light;
    % light('style', 'local', 'position', [5,5,5]);
    
    % X,Y,Z lines representing the 3d space
    line([0, 0], [0, 0], [0,10], 'linewidth', 3);
    line([0, 0], [0,10], [0, 0], 'linewidth', 3);
    line([0,10], [0, 0], [0, 0], 'linewidth', 3);
    
    % Labels (within axes)
    text(11,0,0, 'x', 'fontsize', 30, 'color', [.5, .6, .7]);
    text(0,11,0, 'y', 'fontsize', 30, 'color', [.5, .6, .7]);
    text(0,0,11, 'z', 'fontsize', 30, 'color', [.5, .6, .7]);
    
    % ---------------------------- Loop --------------------------------
    
    % Timer
    % tic;
    
    % Create a game loop to continue until stopped
    loop_on = true;
    
    % while toc
    
    while loop_on
        % Update the viewing angle
        cam_el = cam_el + cam_el_speed;
        cam_az = cam_az + cam_az_speed;
        
        % cam_pos = previous_value + step
        cam_pos = cam_pos + ... 
            cam_fwd_speed*unit_vec(cam_el, cam_az) + ...
            cam_side_speed*unit_vec(0, cam_az + pi/2); 
            % ... add 90 degrees (pie/2 radians) to it
        
        % Update camera position
        ax.CameraPosition = cam_pos;
        ax.CameraTarget = cam_pos + unit_vec(cam_el, cam_az) ;
        
        % Update the figure
        drawnow;
    end
    
    % ------------------------ Functions --------------------------
    
    % Nested function to listen to close events
    % ... prevents errors
    function close_fcn(~,~)
        % Turn of the loop
        loop_on = false;
        
        % Delete the figure
        delete(fig);
    end  
        
    function key_down(~,e) % get event
        switch e.Key
            % Move in three dimensions within the area
            case 'e', cam_fwd_speed  =  .1;
            case 'd', cam_fwd_speed  = -.1;
            case 's', cam_side_speed =  .1;
            case 'f', cam_side_speed = -.1;
            
            % Pan the camera
            case 'i', cam_el_speed =  .02; 
            case 'k', cam_el_speed = -.02; 
            case 'j', cam_az_speed =  .02;
            case 'l', cam_az_speed = -.02;
        end
    end

    function key_up(~,~)
        % Reset the viewing angle
        cam_el_speed   = 0;
        cam_az_speed   = 0;
        cam_fwd_speed  = 0;
        cam_side_speed = 0;
    end

end