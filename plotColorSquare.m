function h = plotColorSquare(type, dimension, stimulusNumber)

categoryPoints = genCategoryPoints(type, dimension, stimulusNumber);

randStimuli = repmat(0, [length(categoryPoints), 3]);
randomizedStimuliSequence = randperm(length(categoryPoints));
randStimuli(:, :) = categoryPoints(randomizedStimuliSequence(:), :);

edgeVertexes = [11, 0, 0; 11, 0, 11; 0, 0, 0; 0, 0, 11; ...
                11, 11, 0; 11, 11, 11; 0, 11, 0; 0, 11, 11];

if type == 1;
  if strcmp(dimension{1}, 'x'); categories = ['A', 'A', 'B', 'B', 'A', 'A', 'B', 'B']; end
  if strcmp(dimension{1}, 'y'); categories = ['B', 'B', 'B', 'B', 'A', 'A', 'A', 'A']; end
  if strcmp(dimension{1}, 'z'); categories = ['B', 'A', 'B', 'A', 'B', 'A', 'B', 'A']; end
end
if type == 4; categories = ['B', 'B', 'B', 'A', 'B', 'A', 'A', 'A']; end
if type == 5; categories = ['B', 'B', 'B', 'A', 'A', 'A', 'A', 'B']; end

close all;
figure(1);
for i = 1:length(categoryPoints)
  subplot(10, 9, i);
  h = randStimuli(i, 1) / 11;
  s = ((randStimuli(i, 2) - 1) * 0.8 + 3) / 11;
  v = ((randStimuli(i, 3) - 1) * 0.8 + 3) / 11;
  category = calCategory(edgeVertexes, categories, randStimuli(i, :));
  stimulusPoints = ['[' num2str(randStimuli(i, 1)) ', ' ...
                        num2str(randStimuli(i, 2)) ', ' ...
                        num2str(randStimuli(i, 3)) ']']; 
  h = fill([0, 5, 5, 0], [0, 0, 5, 5], hsv2rgb([h, s, v]));
  titleString = strcat([category ': ' stimulusPoints]);
  title(titleString);
  axis off;
end