function scene_bonus
    
    % Arrows - turn, move
    % Shift  - toggle viewpoint
    % Enter  - start new Game
       
    % Figure and axes
    set(gcf, ...
        'keypressfcn', @keyboard, ...
        'closerequestfcn', @close_fcn, ...
        'color', [0 0 0], ...
        'menubar', 'none', ...
        'numbertitle', 'off', ...
        'name', 'find color-changing box');
        
    set(gca, ...
        'projection', 'perspective', ...
        'visible', 'off', ...
        'cameraviewangle', 50, ...
        'plotboxaspectratio', [1 1 1], ... 
        'dataaspectratio', [1 1 1]); 
    
    % Variables
    
    box_num     = 50;
    goal_pos    = [1,1,1];
    cam_pos     = [1,1,1]; 
    cam_az      = 0;  
    view_switch = 1;
    program_on  = true;  
    
    % Goal box and 'cam dots'
    
    goal_box = patch;
    cam_dots = line; 
    
    % Init new scene
    new_scene;
    
    % Main loop
    
    tic;
    while program_on               
        
        % Update Camera
        cam_targ = cam_pos + ...
            10*[cosd(cam_az), sind(cam_az), 0];       
        
        if view_switch == 1   
            % first-person view
            set(gca, ... 
                'cameraposition', cam_pos,...        
                'cameratarget',   cam_targ);
        else
            % bird's eye view
            set(gca, ...
                'cameraposition', [50, 50, 100], ...         
                'cameratarget',   [50, 50,   0]);
                
            set(cam_dots, ...
                'xdata', [cam_pos(1), cam_targ(1)], ...
                'ydata', [cam_pos(2), cam_targ(2)]);
        end
        
        % Update color-changing box color
        set( goal_box, ...
            'facecolor', [ ...
            .5 + .5*cos(toc)*cos(toc*1.1),...  
            .5 + .5*cos(toc)*sin(toc*1.1),...
            .5 + .5*sin(toc*1.1)]);
        % If camera near goal, display 'win' and exit loop        
        dist = norm(cam_pos(1,1:2) - goal_pos(1,1:2));
        
        if dist < 2 
            % make 'win' text, pause, delete text, new game
            a = annotation('textbox', ...
                'position', [0,0,1,1], ...
                'color', [1,1,1], ...
                'edgecolor','none', ...
                'fontsize', 120, ...
                'string', {
                'win!'; ' '; 
                'a new game will start in a bit'});
            pause(1);  
            delete(a);
            new_scene;
        else
            drawnow;
        end
    end
    
    % if out of loop, close
    delete(gcf);
    
    % 'New game': Reset camera and refresh graphics
    function new_scene
        
        cla;
        
        % Reset camera
        cam_pos     = [1,1,1]; 
        cam_az      = 0;  
        
         % Reset 'camera dots': pos o---o targ
        cam_dots = line( ...
            'marker', '.', 'markersize', 20, ...
            'xdata',[0,0], 'ydata',[0,0], 'zdata',[1,1]); 
        
        % Generate Boxes
        for i = 1:box_num  
            height = 5*rand + 5*(rand^4);
            box_patch( ...
                100*rand, 100*rand, height, ...
                3*rand,   3*rand,   height);
        end
    
        % Generate color-changing box
        goal_pos = [ ...
            20 + 80*rand, ...
            20 + 80*rand, ...
            height ];                   
    
        goal_box = box_patch( ...
            goal_pos(1), goal_pos(2), goal_pos(3), ...
            3*rand,      3*rand,      height);         
    
        % Floor patch
        patch( ...
            'vertices', 100*[1 0 0; 1 1 0; 0 1 0; 0 0 0], ...
            'faces', [1 2 3 4], ...                                  
            'facecolor', [.5 .5 .5] + .2*rand(1,3));   
    end
    % Box function ( 6 patches )
    function b = box_patch(x,y,z,l,w,h)                               
        
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
    
        b = patch( ...
            'vertices',  vertices', ...
            'faces',     faces,...
            'facecolor', rand(1,3), ...
            'facealpha', .8);
    end
    % Figure window 'keypressfcn'
    function keyboard(~,event)
        switch event.Key
            
            case 'leftarrow', cam_az  = cam_az + 2;
            case 'rightarrow',cam_az  = cam_az - 2;   
            case 'downarrow' 
                cam_pos = cam_pos - [cosd(cam_az), sind(cam_az), 0];
            case 'uparrow' 
                cam_pos = cam_pos + [cosd(cam_az), sind(cam_az), 0];
            
            case 'return', new_scene;
            case 'shift'                                               
                if view_switch == 1 
                    view_switch = 0;
                else
                    view_switch = 1;
                end  
        end
    end
    % Figure window 'close request' function
    function close_fcn(~,~)
        program_on = false;
    end
end