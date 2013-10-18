function [blockMsg, isPrac, categories, randStimuli] = initBlock(block, parms)

isPrac = false;

switch block
  case 'Practice'
    blockMsg = parms.pracMsg;
    stimuliNo = parms.pracStimuliNo;
    isPrac = true;
  case 'Block 1'
    blockMsg = parms.blockMsg;
    categories = parms.block1Categories;
    stimuliNo = parms.stimuliNo;
    stimuliFilename = parms.block1StimuliFilename;
  case 'Block 2'
    blockMsg = parms.blockMsg;
    categories = parms.block2Categories;
    stimuliNo = parms.stimuliNo;
    stimuliFilename = parms.block2StimuliFilename;
  case 'Block 3'
    blockMsg = parms.blockMsg;
    categories = parms.block3Categories;
    stimuliNo = parms.stimuliNo;
    stimuliFilename = parms.block3StimuliFilename;
  case 'Block 4'
    blockMsg = parms.blockMsg;
    categories = parms.block4Categories;
    stimuliNo = parms.stimuliNo;
    stimuliFilename = parms.block4StimuliFilename;
end

typeI = 1;

if strcmp(block, 'Practice')
  dimensionList = {'x', 'y', 'z'};
  dimension = NRandPerm(length(dimensionList), 1);
  randStimuli = genCategoryPoints(typeI, cellstr(dimensionList{dimension}), stimuliNo);
  if dimensionList{dimension} == 'x'; categories = parms.typeIXCategories; end
  if dimensionList{dimension} == 'y'; categories = parms.typeIYCategories; end
  if dimensionList{dimension} == 'z'; categories = parms.typeIZCategories; end
else
  stimuliFile = load(stimuliFilename);
  stimuli = stimuliFile.stimuli;
  
  randStimuliOne = repmat(0, [length(stimuli), 3]);
  randomizedStimuliSequenceOne = randperm(length(stimuli));
  randStimuliOne(:, :) = stimuli(randomizedStimuliSequenceOne(:), :);

  randStimuliTwo = repmat(0, [length(stimuli), 3]);
  randomizedStimuliSequenceTwo = randperm(length(stimuli));
  randStimuliTwo(:, :) = stimuli(randomizedStimuliSequenceTwo(:), :);

  randStimuliThree = repmat(0, [(parms.maxTrialNo - (2 * length(stimuli))), 3]);
  randomizedStimuliSequenceThree = randperm((parms.maxTrialNo - (2 * length(stimuli))));
  randStimuliThree(:, :) = stimuli(randomizedStimuliSequenceThree(:), :);

  randStimuli = [randStimuliOne; randStimuliTwo; randStimuliThree];
end