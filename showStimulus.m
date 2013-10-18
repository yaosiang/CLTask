function [flipStart, stimulusOnset] = showStimulus(windowPtr, stimulusType, stimulus)

% Determine which type of stimulus need to show:
isRadiation = false;
isTriangle = false;
isSquare = false;
if strcmp(stimulusType, 'radiation'); isRadiation = true; end
if strcmp(stimulusType, 'triangle');  isTriangle = true;  end
if strcmp(stimulusType, 'square');    isSquare = true;    end

% Calculate the center point of window:
rect = Screen('Rect', windowPtr);
centerWidth = rect(3) / 2;
centerHeight = rect(4) / 2;

% Predefine color name:
red = [255, 0, 0];
green = [0, 255, 0];
blue = [0, 0, 255];

if isRadiation
  xDimensionX1 = cos(pi / 2) * 15 + centerWidth;
  xDimensionY1 = centerHeight - sin(pi / 2) * 15;
  yDimensionX1 = cos((420 / 360) * pi) * 15 + centerWidth;
  yDimensionY1 = centerHeight - sin((420 / 360) * pi) * 15;
  zDimensionX1 = cos((660 / 360) * pi) * 15 + centerWidth;
  zDimensionY1 = centerHeight - sin((660 / 360) * pi) * 15;
  xDimensionX2 = cos(pi / 2) * (stimulus(1) * 30 + 15) + centerWidth;
  xDimensionY2 = centerHeight - sin(pi / 2) * (stimulus(1) * 30 + 15);
  yDimensionX2 = cos((420 / 360) * pi) * (stimulus(2) * 30 + 15) + centerWidth;
  yDimensionY2 = centerHeight - sin((420 / 360) * pi) * (stimulus(2) * 30 + 15);
  zDimensionX2 = cos((660 / 360) * pi) * (stimulus(3) * 30 + 15) + centerWidth;
  zDimensionY2 = centerHeight - sin((660 / 360) * pi) * (stimulus(3) * 30 + 15);

  xDimensionOffsetX1 = cos(0 * pi) * 5;
  xDimensionOffsetY1 = sin(0 * pi) * 5;
  xDimensionOffsetX2 = cos(pi) * 5;
  xDimensionOffsetY2 = sin(pi) * 5;
  yDimensionOffsetX1 = cos((120 / 180) * pi) * 5;
  yDimensionOffsetY1 = sin((120 / 180) * pi) * 5;
  yDimensionOffsetX2 = cos((600 / 360) * pi) * 5;
  yDimensionOffsetY2 = sin((600 / 360) * pi) * 5;
  zDimensionOffsetX1 = cos(pi / 3) * 5;
  zDimensionOffsetY1 = sin(pi / 3) * 5;
  zDimensionOffsetX2 = cos((480 / 360) * pi) * 5;
  zDimensionOffsetY2 = sin((480 / 360) * pi) * 5;

  xDimensionPointList = [xDimensionX1 + xDimensionOffsetX1, xDimensionY1 + xDimensionOffsetY1; ...
                         xDimensionX1 + xDimensionOffsetX2, xDimensionY1 + xDimensionOffsetY2; ...
                         xDimensionX2 + xDimensionOffsetX2, xDimensionY2 + xDimensionOffsetY2; ...
                         xDimensionX2 + xDimensionOffsetX1, xDimensionY2 + xDimensionOffsetY1];
  yDimensionPointList = [yDimensionX1 + yDimensionOffsetX1, yDimensionY1 - yDimensionOffsetY1; ...
                         yDimensionX1 + yDimensionOffsetX2, yDimensionY1 - yDimensionOffsetY2; ...
                         yDimensionX2 + yDimensionOffsetX2, yDimensionY2 - yDimensionOffsetY2; ...
                         yDimensionX2 + yDimensionOffsetX1, yDimensionY2 - yDimensionOffsetY1];
  zDimensionPointList = [zDimensionX1 + zDimensionOffsetX1, zDimensionY1 - zDimensionOffsetY1; ...
                         zDimensionX1 + zDimensionOffsetX2, zDimensionY1 - zDimensionOffsetY2; ...
                         zDimensionX2 + zDimensionOffsetX2, zDimensionY2 - zDimensionOffsetY2; ...
                         zDimensionX2 + zDimensionOffsetX1, zDimensionY2 - zDimensionOffsetY1];

  Screen('FillPoly', windowPtr, red,   xDimensionPointList);
  Screen('FillPoly', windowPtr, green, yDimensionPointList);
  Screen('FillPoly', windowPtr, blue,  zDimensionPointList);
end

if isTriangle
  xDimensionX2 = cos(pi / 2) * (stimulus(1) * 30 + 15) + centerWidth;
  xDimensionY2 = centerHeight - sin(pi / 2) * (stimulus(1) * 30 + 15);
  yDimensionX2 = cos((420 / 360) * pi) * (stimulus(2) * 30 + 15) + centerWidth;
  yDimensionY2 = centerHeight - sin((420 / 360) * pi) * (stimulus(2) * 30 + 15);
  zDimensionX2 = cos((660 / 360) * pi) * (stimulus(3) * 30 + 15) + centerWidth;
  zDimensionY2 = centerHeight - sin((660 / 360) * pi) * (stimulus(3) * 30 + 15);

  % X dimension:
  x = sqrt(power((xDimensionX2 - centerWidth), 2) + power((xDimensionY2 - centerHeight), 2));
  y = sqrt(power((xDimensionX2 - yDimensionX2), 2) + power((xDimensionY2 - yDimensionY2), 2));
  z = sqrt(power((yDimensionX2 - centerWidth), 2) + power((yDimensionY2 - centerHeight), 2));
  theta = 90 - acosd((power(x, 2) + power(y, 2) - power(z, 2)) / (2 * x * y));
  xArm1X1 = xDimensionX2 - sind(theta) * 30;
  xArm1Y1 = xDimensionY2 - cosd(theta) * 30;
  xArm1X2 = xDimensionX2 - sind(theta) * (30 + 10);
  xArm1Y2 = xDimensionY2 - cosd(theta) * (30 + 10);
  xArm2X1 = yDimensionX2 - sind(theta) * 30;
  xArm2Y1 = yDimensionY2 - cosd(theta) * 30;
  xArm2X2 = yDimensionX2 - sind(theta) * (30 + 10);
  xArm2Y2 = yDimensionY2 - cosd(theta) * (30 + 10);

  % Y dimension:
  x1 = sqrt(power((yDimensionX2 - centerWidth), 2) + power((yDimensionY2 - centerHeight), 2));
  y1 = sqrt(power((yDimensionX2 - zDimensionX2), 2) + power((yDimensionY2 - zDimensionY2), 2));
  z1 = sqrt(power((zDimensionX2 - centerWidth), 2) + power((zDimensionY2 - centerHeight), 2));
  theta1 = acosd((power(x1, 2) + power(y1, 2) - power(z1, 2)) / (2 * x1 * y1));
  x2 = sqrt(power((yDimensionX2 - centerWidth), 2) + power((yDimensionY2 - centerHeight), 2));
  y2 = sqrt(power((yDimensionX2 - yDimensionX2), 2) + power((yDimensionY2 - centerHeight), 2));
  z2 = sqrt(power((yDimensionX2 - centerWidth), 2) + power((centerHeight - centerHeight), 2));
  theta2 = acosd((power(x2, 2) + power(y2, 2) - power(z2, 2)) / (2 * x2 * y2));
  theta = 360 + (180 - (theta1 + theta2 + 90));
  yArm1X1 = yDimensionX2 + sind(theta) * 30;
  yArm1Y1 = yDimensionY2 + cosd(theta) * 30;
  yArm1X2 = yDimensionX2 + sind(theta) * (30 + 10);
  yArm1Y2 = yDimensionY2 + cosd(theta) * (30 + 10);
  yArm2X1 = zDimensionX2 + sind(theta) * 30;
  yArm2Y1 = zDimensionY2 + cosd(theta) * 30;
  yArm2X2 = zDimensionX2 + sind(theta) * (30 + 10);
  yArm2Y2 = zDimensionY2 + cosd(theta) * (30 + 10);
  
  % Z dimension:
  x = sqrt(power((xDimensionX2 - centerWidth), 2) + power((xDimensionY2 - centerHeight), 2));
  y = sqrt(power((xDimensionX2 - zDimensionX2), 2) + power((xDimensionY2 - zDimensionY2), 2));
  z = sqrt(power((zDimensionX2 - centerWidth), 2) + power((zDimensionY2 - centerHeight), 2));
  theta = 90 + acosd((power(x, 2) + power(y, 2) - power(z, 2)) / (2 * x * y));
  zArm1X1 = xDimensionX2 + sind(theta) * 30;
  zArm1Y1 = xDimensionY2 + cosd(theta) * 30;
  zArm1X2 = xDimensionX2 + sind(theta) * (30 + 10);
  zArm1Y2 = xDimensionY2 + cosd(theta) * (30 + 10);
  zArm2X1 = zDimensionX2 + sind(theta) * 30;
  zArm2Y1 = zDimensionY2 + cosd(theta) * 30;
  zArm2X2 = zDimensionX2 + sind(theta) * (30 + 10);
  zArm2Y2 = zDimensionY2 + cosd(theta) * (30 + 10);
  
  xDimensionPointList = [xArm1X1, xArm1Y1; xArm1X2, xArm1Y2; xArm2X2, xArm2Y2; xArm2X1, xArm2Y1];
  yDimensionPointList = [yArm1X1, yArm1Y1; yArm1X2, yArm1Y2; yArm2X2, yArm2Y2; yArm2X1, yArm2Y1];
  zDimensionPointList = [zArm1X1, zArm1Y1; zArm1X2, zArm1Y2; zArm2X2, zArm2Y2; zArm2X1, zArm2Y1];

  Screen('FillPoly', windowPtr, red,   xDimensionPointList);
  Screen('FillPoly', windowPtr, green, yDimensionPointList);
  Screen('FillPoly', windowPtr, blue,  zDimensionPointList);
end

if isSquare
  % When saturation is too low, such as 1 or 2.
  % The color square will looks like a whole gray square.
  % In additation, when value is too low.
  % The color square will looks like a whole black square.
  % We transform the scale from 1-11 to 3-11 on saturation and vale.
  rgb = (hsv2rgb([stimulus(1) / 11, ...
                ((stimulus(2) - 1) * 0.8 + 3) / 11, ...
                ((stimulus(3) - 1) * 0.8 + 3) / 11])) * 255;

  Screen('FillRect', windowPtr, rgb, ...
    [centerWidth - 150, centerHeight - 150, ...
     centerWidth + 150, centerHeight + 150]);
end

Screen('DrawingFinished', windowPtr);

[flipStart, stimulusOnset] = Screen('Flip', windowPtr, 0);