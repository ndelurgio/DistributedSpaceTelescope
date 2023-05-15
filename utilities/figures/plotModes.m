% Plotting the modes
figure;
hold on;

% Import data
modes = telem.("Data_5");
times = time;
mode_names = ["science", "formationBreak", "passive", "formationAcquisition"];
colors = ["blue", "red", "green", "black"];
color_dict = dictionary(mode_names , colors);

% Initialize variables
current_mode = modes(1);
mode_start = times(1);
y = 1; % Vertical position of the modes

% Loop through each time instance
for i = 2:length(times)
    % Check if the mode has changed
    if ~strcmp(modes(i), current_mode)
        color = char(color_dict(modes(i)));
        % Plot a box for the previous mode
        rectangle('Position', [mode_start/3600, y-0.5, (times(i-1)-mode_start)/3600, 1], 'FaceColor', [convert_color(color(1)), 0.1], 'EdgeColor', color);
        % Add text annotation for the previous mode
        text(mode_start/3600, y, current_mode, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle', 'FontSize', 10);
        
        % Update current mode and mode start
        current_mode = modes(i);
        mode_start = times(i);
        
        % Increment the vertical position
        y = y + 1;
    end
end

% Plot a box for the last mode
rectangle('Position', [mode_start/3600, y-0.5, (time(end)-mode_start+1)/3600, 1], 'FaceColor', [convert_color(color(1)), 0.1]', 'EdgeColor', 'blue');

% Add text annotation for the last mode
text(mode_start/3600, y, current_mode, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');

xlabel('Time [hr]');
ylabel("Mode switches")


function outColor = convert_color(inColor)

  charValues = 'rgbcmywk'.';  %#'
  rgbValues = [eye(3); 1-eye(3); 1 1 1; 0 0 0];
  assert(~isempty(inColor),'convert_color:badInputSize',...
         'Input argument must not be empty.');

  if ischar(inColor)  %# Input is a character string

    [isColor,colorIndex] = ismember(inColor(:),charValues);
    assert(all(isColor),'convert_color:badInputContents',...
           'String input can only contain the characters ''rgbcmywk''.');
    outColor = rgbValues(colorIndex,:);

  elseif isnumeric(inColor) || islogical(inColor)  %# Input is a numeric or
                                                   %#   logical array
    assert(size(inColor,2) == 3,'convert_color:badInputSize',...
           'Numeric input must be an N-by-3 matrix');
    inColor = double(inColor);           %# Convert input to type double
    scaleIndex = max(inColor,[],2) > 1;  %# Find rows with values > 1
    inColor(scaleIndex,:) = inColor(scaleIndex,:)./255;  %# Scale by 255
    [isColor,colorIndex] = ismember(inColor,rgbValues,'rows');
    assert(all(isColor),'convert_color:badInputContents',...
           'RGB input must define one of the colors ''rgbcmywk''.');
    outColor = charValues(colorIndex(:));

  else  %# Input is an invalid type

    error('convert_color:badInputType',...
          'Input must be a character or numeric array.');

  end
end
