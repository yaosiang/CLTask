function main(blockSequenceType, stimulusType)

% Make sure the length and format of each input argument is correct:
assert(nargin == 2, ...
       'You must call this function with two arguments.');
assert(ischar(blockSequenceType) == 1, ...
       'Argument blockSequenceType must be a string.');
assert((strcmp(blockSequenceType, 'fix') || ...
        strcmp(blockSequenceType, 'random')), ...
        'Argument blockSequenceType must be either fix, or random.');
assert(ischar(stimulusType) == 1, ...
       'Argument stimulusType must be a string.');
assert((strcmp(stimulusType, 'radiation')) || ...
       (strcmp(stimulusType, 'triangle'))  || ...
       (strcmp(stimulusType, 'square')), ...
       'Argument stimulusType must be either radiation, triangle, or square.');

beginTime = datestr(now);

% Get experimental parameters:
parms = getParameters;

parms.stimulusType = stimulusType;

% Get subject id, abort when subject id is exist or any impossible value:
parms.subjectId = getSubjectId;
if parms.subjectId == -1
  disp('Experiment aborted.');
  return;
end

% Check for OpenGL compatibility, abort otherwise:
AssertOpenGL;

% Reseed the random-number generator for each experiment:
rand('twister', sum(100 * clock));

% Make sure keyboard mapping is the same on all supported operating systems
% Apple MacOS/X, MS-Windows, and GNU/Linux:
KbName('UnifyKeyNames');

% Predefine key name:
spaceKey = KbName('SPACE');

% Define and validate the filename of result file:
resultFilename = strcat('subject_', num2str(parms.subjectId), '.txt');
isFileValid = checkFileExist(resultFilename);
assert(isFileValid, 'Subject was duplicated!');


try
  % Beginning of experiment

  % Get screenNumber of stimulation display. We choose the display with
  % the maximum index, which is usually the right one:
  screens = Screen('Screens');
  screenNumber = max(screens);

  % Change the sreen resolution to 1024 * 768 and refresh rate 60 Hz:
  resolution = NearestResolution(screenNumber, ...
                                 parms.screenWidth, ...
                                 parms.screenHeight, ...
                                 parms.screenRefreshRate);
  oldResolution = SetResolution(screenNumber, resolution);

  % Hide the mouse cursor:
  HideCursor;

  % Do dummy calls to GetSecs, WaitSecs, KbCheck to make sure
  % they are loaded and ready when we need them - without delays
  % in the wrong moment:
  KbCheck;
  WaitSecs(0.1);
  GetSecs;
 
  % Disable inputs from MATLAB:
  ListenChar(2);
  
  % Open a double buffered fullscreen window on the stimulation screen
  % 'screenNumber' and choose/draw a black background. 'windowPtr' is the
  % handle used to direct all drawing commands to that window - the "Name"
  % of the window. 'rect' is a rectangle defining the size of the window:
  windowPtr = Screen('OpenWindow', screenNumber, parms.backColor);
  
  % Set text size:
  Screen('TextSize', windowPtr, parms.textSize);
  
  % Show instruction message:
  showInstruction(windowPtr, parms.stimulusType, 1, 3, parms.foreColor);  

  % Show question message:
  showCenteredMessage(windowPtr, parms.questionMsg, parms.foreColor);
  getResponseRT(spaceKey);

  blockNameList = {'Block 1', 'Block 2', 'Block 3', 'Block 4'};
  if strcmp(blockSequenceType, 'fix')
    blockSequence = 1:length(blockNameList);
  else
    blockSequence = randperm(length(blockNameList));
  end

  % The length of result cell correspond with the block numbers:
  result = cell(1, 5);

  tic
  result{1} = doBlock('Practice', windowPtr, parms);
  % Show question message again:
  showCenteredMessage(windowPtr, parms.question2Msg, parms.foreColor);
  getResponseRT(spaceKey);
  parms.blockMsg = parms.block1Msg;
  result{2} = doBlock(blockNameList{blockSequence(1)}, windowPtr, parms);
  parms.blockMsg = parms.block2Msg;
  result{3} = doBlock(blockNameList{blockSequence(2)}, windowPtr, parms);
  result{4} = doBlock(blockNameList{blockSequence(3)}, windowPtr, parms);
  result{5} = doBlock(blockNameList{blockSequence(4)}, windowPtr, parms);
  rt = toc;
  
  % Show thank you message:
  showCenteredMessage(windowPtr, parms.thanksMsg, parms.foreColor);
  KbWait([], 2);

  % Show escape message:
  showCenteredMessage(windowPtr, parms.escapeMsg, parms.foreColor);
  KbWait([], 2);
  
  endTime = datestr(now);

  % Generate result file:
  fid = fopen(strcat('data', filesep, resultFilename), 'wt');

  % Insert subject information to result file:
  fprintf(fid, '受試者編號: %d\n', parms.subjectId);
  fprintf(fid, '實驗電腦名稱: %s', getComputerName);
  fprintf(fid, '實驗開始時間: %s\n', beginTime);
  fprintf(fid, '實驗結束時間: %s\n', endTime);
  fprintf(fid, '實驗耗費時間: %f 秒\n', rt);
  fprintf(fid, '刺激材料圖形: %s\n\n', parms.stimulusType);

  % Generate result file header:
  str = textscan(parms.header, '%s', 'delimiter', ' ');
  for i = 1:length(str{1})
    fprintf(fid, '%s\t\t', str{1}{i});
  end
  fprintf(fid, '\n');

  % Insert result to result file:
  for i = 1:length(result)
    for j = 1:length(result{i}{1})
      fprintf(fid, '%s\t', result{i}{1}{j});
      fprintf(fid, '%d\t', result{i}{2}{j});
      fprintf(fid, '%s\t', result{i}{3}{j});
      fprintf(fid, '%c\t', result{i}{4}{j});
      fprintf(fid, '%c\t', result{i}{5}{j});
      fprintf(fid, '%f\t', result{i}{6}{j});
      fprintf(fid, '%c\n', result{i}{7}{j});
    end
  end
  fclose(fid);

  % Save result as a MAT file:
  filename = strcat('data', filesep, 'result_', num2str(parms.subjectId), '.mat');
  save(filename);

  % Cleanup at end of experiment - Close window, show mouse cursor, 
  % switch MATLAB back to priority 0 -- normal priority:
  Screen('CloseAll');
  SetResolution(screenNumber, oldResolution);
  ShowCursor;

  % Enable inputs from MATLAB:
  ListenChar(0);

  % End of experiment:
  return;
catch
  % Do same cleanup as at the end of a regular session...
  Screen('CloseAll');
  SetResolution(screenNumber, oldResolution);
  ShowCursor;
  ListenChar(0);
  
  % Output the error message that describes the error:
  ple(psychlasterror);
end