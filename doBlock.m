function blockResult = doBlock(block, windowPtr, parms)

% Initialize stimuli that are needed in this block:
[blockMsg, isPrac, categories, stimuli] = initBlock(block, parms);

% Display block message:
showCenteredMessage(windowPtr, blockMsg, parms.foreColor);
getResponseRT(KbName('SPACE'));

% Do trials and get returned result in this block:
[category, response, rt, acc] = doTrials(parms, windowPtr, isPrac, categories, stimuli);

% Calculate the length of the trials:
nResponses = textscan(response, '%s', 'delimiter', ',');
nTrials = length(nResponses{:});

% Calculate the length of header:
header = textscan(parms.header, '%s', 'delimiter', ' ');

blockResult = cell(1, length(header{1}));
temp = cell(1, nTrials);

% Insert block name:
for i = 1:nTrials
  switch block
    case 'Practice'
      temp{i} = 'Prac';
    case 'Block 1'
      temp{i} = 'Block1';
    case 'Block 2'
      temp{i} = 'Block2';
    case 'Block 3'
      temp{i} = 'Block3';
    case 'Block 4'
      temp{i} = 'Block4';
  end
end
blockResult{1} = temp;

% Insert trial number:
blockResult{2} = num2cell(1:nTrials);

% Insert stimulus:
for i = 1:nTrials
  if isPrac
    index = rem(i, parms.pracStimuliNo);
    if index == 0;
      index = parms.pracStimuliNo;
    end
  else
    index = rem(i, parms.maxTrialNo);
    if index == 0;
      index = parms.maxTrialNo;
    end
  end
  temp{i} = mat2str(stimuli(index, :));
end
blockResult{3} = temp;

% Insert stimulus category:
category = textscan(category, '%s', 'delimiter', ',');
for i = 1:length(category{1})
  temp{i} = category{1}{i};
end
blockResult{4} = temp;

% Insert subject response:
response = textscan(response, '%s', 'delimiter', ',');
for i = 1:length(response{1})
  temp{i} = response{1}{i};
end
blockResult{5} = temp;

% Insert reaction time:
blockResult{6} = num2cell(rt);

% Insert response accuracy:
acc = textscan(acc, '%s', 'delimiter', ',');
for i = 1:length(acc{1})
  temp{i} = acc{1}{i};
end
blockResult{7} = temp;