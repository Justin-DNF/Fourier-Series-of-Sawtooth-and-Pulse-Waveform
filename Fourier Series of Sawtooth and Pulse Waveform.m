response = menu('Make a choice' , 'PULSE' , 'SAWTOOTH'); % make a choice between PULSE and SAWTOOTH
switch response
    % PULSE
    case 1
        clear all;
        
        speed = menu('Animation Speed' , 'very slow' , 'slow' , 'average' , 'fast' , 'very fast');
        switch speed
            case 1 % very slow
                dt = 1e-9;
            case 2 % slow
                dt = 1e-8;
            case 3 % average
                dt = 1e-7;
            case 4 % fast
                dt = 1e-6;
            case 5 % very fast
                dt = 1e-5;
        end
        
        number = input('How many terms do you want in the series? ');      
        f = 1000; % frequency
        w = 2*pi*f; % Period
        phase = 0;

        px = 0.5; 
        py = 0;
        Cox = 0.5; % starting point in x
        Coy = 0;  % starting point in y
 
        x = [Cox]; % x location to draw outliner
        y = [Coy]; % y location to draw outliner
        z = []; % Appoximate number
        t = []; % time
        a = []; % x location to draw lines inside
        b = []; % y location to draw lines inside
        
        for i = 0 : dt : 2e-3 % loop to draw the time and approximate
            for n = 1:number % loop to put lines inside in array and outliner
                C = (2 * sin((n*pi)/2))/(n*pi); % coefficient
                x1 = C * cos(n*i*w + phase); % x-location
                y1 = C * sin(n*i*w + phase); % y-location
                px = px + x1; % sum of x
                py = py + y1; % sum of y
                a = [a px];
                b = [b py];   
            end
            
            t = [t i]; % time
            z = [z px]; % Approximate
            % plot "Fourier seriers of a pulse waveform"
            subplot(1,2,1)
            plot(t , z , '.'); 
            axis([0 2e-3 -1 1.5]); axis square;
            ylabel('Approximation'); 
            xlabel('Time (seconds)'); 
            title('Fourier seriers of a pulse waveform');
            grid;
    
            x = [x px];
            y = [y py];
            
            for s = 1 : number-1 % loop to draw lines inside
                subplot(1,2,2)
                % x and y are locations as the outliner
                % draw a line from (0,0) to (0.5,0) , and a line from (0.5,0) to the starting point C1 every it changes 
                plot(x , y , '.', [0 x(1)] , [0 y(1)] , 'r', [x(1) a(1)], [y(1) b(1)] , 'b', 'Linewidth', 2); hold on;
                % draw other lines inside
                plot([a(s) a(s+1)] , [b(s) b(s+1)], 'Linewidth', 2); hold on;
            end
            % draw a line from (0,0) to the ending point of Cn
            plot([0 a(number)] , [0 b(number)] , '--k'); hold on;
            hold off;
            axis([-1 2 -1.5 1.5]); axis square;
            ylabel('y axis'); 
            xlabel('x axis');
            title('Summation of Phasors');
            grid;
            
            pause(1e-32);
            % reset variables
            px = 0.5;
            py = 0;
            a = [];
            b = [];
        end
        
    %SAWTOOTH
    case 2
        clear all;
        speed = menu('Animation Speed' , 'very slow' , 'slow' , 'average' , 'fast' , 'very fast');
        switch speed
            case 1 % very slow
                dt = 1e-9;
            case 2 % slow
                dt = 1e-8;
            case 3 % average
                dt = 1e-7;
            case 4 % fast
                dt = 1e-6;
            case 5 % very fast
                dt = 1e-5;
        end
        number = input('How many terms do you want in the series? ');
        f = 1000; % frequency
        w = 2*pi*f; % period
        phase = pi/2;
        
        px = 0.5; 
        py = 0; 
        Cox = 0.5; % starting point in x
        Coy = 0; % starting point in y
        
        x = [Cox]; % the x location outliner
        y = [Coy]; % the y location outliner
        z = []; % Approximate
        t = []; % time
        a = []; % the x location of lines inside
        b = []; % the y location of lines inside

        for i = 0:dt:2e-3 % loop to draw time and approximate
            for n = 1:number % loop to draw lines inside in array and outliner
                C = 1/(pi*n); % Cn
                x2 = C * cos(n*i*w + phase); % x location of outliner
                y2 = C * sin(n*i*w + phase); % y location of outliner
                px = px + x2; % sum of x
                py = py + y2; % sum of y
                a = [a px];
                b = [b py];   
            end
            
            t = [t i]; % time 
            z = [z px]; % approximate
            % plot "Fourier seriers of a pulse sawtoothform"
            subplot(1,2,1)
            plot(t , z , '.'); 
            axis([0 2e-3 -1 1.5]); axis square;
            ylabel('Approximation'); 
            xlabel('Time (seconds)'); 
            title('Fourier seriers of a sawtooth waveform');
            grid;
    
            x = [x px];
            y = [y py];
            % draw outliner and lines inside
            for s = 1 : number-1
                subplot(1,2,2)
                %x and y are location as the outliner
                 % x and y are locations as the outliner
                % draw a line from (0,0) to (0.5,0) , and a line from (0.5,0) to the starting point C1 every it changes 
                plot(x , y , '.', [0 Cox] , [0 0] , 'r', [Cox a(1)], [0 b(1)] , 'b', 'Linewidth', 2); hold on;
                % draw other lines
                plot([a(s) a(s+1)] , [b(s) b(s+1)], 'Linewidth', 2); hold on;
            end
            %draw line from (0,0) to ending point of Cn
            plot([0 a(number)] , [0 b(number)] , '--k'); hold on
            hold off;
            axis([-0.5 1.5 -1 1.5]); axis square;
            ylabel('y axis'); 
            xlabel('x axis');
            title('Summation of Phasors');
            grid;
            
            pause(1e-32);
            %reset variables    
            px = 0.5;
            py = 0;
            a = [];
            b = [];
        end
end