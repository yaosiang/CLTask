function [category, response, rt, acc] = doTrials(parms, windowPtr, isPrac, categories, stimuli)

% Predefine key name:
aKey = KbName('f');
bKey = KbName('j');
spaceKey = KbName('SPACE');
responseKeySet = [aKey, bKey];

% Generate result martix:
category = [];
response = [];
rt = [];
acc = [];

correctNo = 0;
criterion = parms.criterion;
stimulusType = parms.stimulusType;

% Display ready message:
showCenteredMessage(windowPtr, parms.readyMsg, parms.foreColor);
getResponseRT(spaceKey);

% Do trial until meet criterion or reach the max trial number:
trialCount = 1;
while (correctNo < criterion) && (trialCount <= parms.maxTrialNo)

  if isPrac
    if rem(trialCount, parms.pracStimuliNo + 1) == 0;
      break;
    end

    index = rem(trialCount, parms.pracStimuliNo);

    if index == 0;
      index = parms.pracStimuliNo;
    end
  else
    index = rem(trialCount, parms.maxTrialNo);

    if index == 0;
      index = parms.maxTrialNo;
    end
  end

  stimulusCategory = calCategory(parms.edgeVertexes, categories, stimuli(index, :));
  category = [category ',' stimulusCategory];

  % Make fixation 3 times bigger:  
  Screen('TextSize', windowPtr, parms.textSize * 3);
  showCenteredMessage(windowPtr, parms.fixationMsg, parms.foreColor);
  Screen('TextSize', windowPtr, parms.textSize);
  WaitSecs(parms.fixationDuration);
  
  % Display target:
  [flipStart, stimulusOnset] = showStimulus(windowPtr, stimulusType, stimuli(index, :));

  % Get subject response and rt:
  [subjectResponse, rt(trialCount)] = getResponseRT(responseKeySet, stimulusOnset);
  if subjectResponse == aKey; subjectResponse = 'A'; end
  if subjectResponse == bKey; subjectResponse = 'B'; end
  response = [response ',' subjectResponse];

  isCorrect = false;
  isWrong = false;

  if stimulusCategory == 'A'
    if subjectResponse == 'A'
      isCorrect = true;
    else
      isWrong = true;
    end
  else
    if subjectResponse == 'B'
      isCorrect = true;
    else
      isWrong = true;
    end
  end

  if isCorrect
    acc = [acc ',Y'];
    correctNo = correctNo + 1;
    showCenteredMessage(windowPtr, parms.correctMsg, parms.foreColor);
  end

  if isWrong
    acc = [acc ',N'];
    correctNo = 0;
    showCenteredMessage(windowPtr, parms.errorMsg, parms.foreColor);
  end

  WaitSecs(1);

  Screen('Flip', windowPtr, 0);
  WaitSecs(parms.ITI);

  trialCount = trialCount + 1;
end

category = category(2:end);
response = response(2:end);
acc = acc(2:end);