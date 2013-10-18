function accuracy = expectedAccuracy

files = FileFromFolder('stimuli');

blockNo = 1;
edgeVertexes = [11, 0, 0; 11, 0, 11; 0, 0, 0; 0, 0, 11; ...
                11, 11, 0; 11, 11, 11; 0, 11, 0; 0, 11, 11];

% Read data file:
for i = 1:length(files)
  filename = strcat('stimuli', filesep, files(i).name);
  stimuliFile = load(filename);
  stimuli = stimuliFile.stimuli;

  trueRule = zeros(1, length(stimuli));
  trueRuleVI = zeros(1, length(stimuli));
  trueRuleIV = zeros(1, length(stimuli));
  alternativeRule1 = zeros(1, length(stimuli));
  alternativeRule2 = zeros(1, length(stimuli));
  alternativeRule3 = zeros(1, length(stimuli));
  alternativeRule4 = zeros(1, length(stimuli));
  alternativeRule5 = zeros(1, length(stimuli));
  alternativeRule6 = zeros(1, length(stimuli));
  alternativeRule7 = zeros(1, length(stimuli));
  alternativeRule8 = zeros(1, length(stimuli));
  alternativeRule9 = zeros(1, length(stimuli));
  alternativeRule10 = zeros(1, length(stimuli));
  alternativeRule11 = zeros(1, length(stimuli));
  alternativeRule12 = zeros(1, length(stimuli));

  if i == 1
    categories = ['B', 'A', 'A', 'B', 'A', 'B', 'B', 'A'];
  elseif i == 2
    categories = ['B', 'A', 'B', 'A', 'B', 'A', 'B', 'A'];
  elseif i == 3
    categories = ['B', 'B', 'B', 'B', 'A', 'A', 'A', 'A'];
  else
    categories = ['B', 'B', 'B', 'A', 'A', 'A', 'A', 'B'];
  end
  
  for j = 1:length(stimuli)

    trueCategory = calCategory(edgeVertexes, categories, stimuli(j, :));
    if strcmp(trueCategory, 'A')
      trueRule(j) = 1;
      
      if i == 1;
        trueRuleVI(j) = 1;
      end

      if i == 4
        trueRuleIV(j) = 1;
      end
    end

    if stimuli(j, 1) + stimuli(j, 2) > stimuli(j, 3)
      alternativeRule1(j) = 1;
    end
    if stimuli(j, 1) + stimuli(j, 2) <= stimuli(j, 3)
      alternativeRule2(j) = 1;
    end

    if stimuli(j, 2) + stimuli(j, 3) > stimuli(j, 1)
      alternativeRule3(j) = 1;
    end
    if stimuli(j, 2) + stimuli(j, 3) <= stimuli(j, 1)
      alternativeRule4(j) = 1;
    end

    if stimuli(j, 3) + stimuli(j, 1) > stimuli(j, 2)
      alternativeRule5(j) = 1;
    end
    if stimuli(j, 3) + stimuli(j, 1) <= stimuli(j, 2)
      alternativeRule6(j) = 1;
    end

    if stimuli(j, 1) > 5
      alternativeRule7(j) = 1;
    end
    if stimuli(j, 1) <= 5
      alternativeRule8(j) = 1;
    end
    
    if stimuli(j, 2) > 5
      alternativeRule9(j) = 1;
    end
    if stimuli(j, 2) <= 5
      alternativeRule10(j) = 1;
    end
    
    if stimuli(j, 3) > 5
      alternativeRule11(j) = 1;
    end
    if stimuli(j, 3) <= 5
      alternativeRule12(j) = 1;
    end
  end

  if i == 1
    accuracy = [length(find(alternativeRule7 == trueRule)) / length(stimuli), ...
                length(find(alternativeRule8 == trueRule)) / length(stimuli), ...
                length(find(alternativeRule9 == trueRule)) / length(stimuli), ...
                length(find(alternativeRule10 == trueRule)) / length(stimuli), ...
                length(find(alternativeRule11 == trueRule)) / length(stimuli), ...
                length(find(alternativeRule12 == trueRule)) / length(stimuli)];
  end

  fprintf('\nBlock %d\n', blockNo);
  fprintf('Strategy: X + Y >  Z  ==> F, Pr: %f\n', length(find(alternativeRule1 == trueRule)) / length(stimuli));
  fprintf('Strategy: X + Y <= Z  ==> F, Pr: %f\n', length(find(alternativeRule2 == trueRule)) / length(stimuli));
  fprintf('Strategy: Y + Z >  X  ==> F, Pr: %f\n', length(find(alternativeRule3 == trueRule)) / length(stimuli));
  fprintf('Strategy: Y + Z <= X  ==> F, Pr: %f\n', length(find(alternativeRule4 == trueRule)) / length(stimuli));
  fprintf('Strategy: Z + X >  Y  ==> F, Pr: %f\n', length(find(alternativeRule5 == trueRule)) / length(stimuli));
  fprintf('Strategy: Z + X <= X  ==> F, Pr: %f\n', length(find(alternativeRule6 == trueRule)) / length(stimuli));
  fprintf('Strategy: X >  5      ==> F, Pr: %f\n', length(find(alternativeRule7 == trueRule)) / length(stimuli));
  fprintf('Strategy: X <= 5      ==> F, Pr: %f\n', length(find(alternativeRule8 == trueRule)) / length(stimuli));
  if i == 3
    fprintf('Strategy: Y >  5      ==> F, Pr: %f (True Rule)\n', length(find(alternativeRule9 == trueRule)) / length(stimuli));
    fprintf('Strategy: Y <= 5      ==> F, Pr: %f (Should be 0)\n', length(find(alternativeRule10 == trueRule)) / length(stimuli));
  else
    fprintf('Strategy: Y >  5      ==> F, Pr: %f\n', length(find(alternativeRule9 == trueRule)) / length(stimuli));
    fprintf('Strategy: Y <= 5      ==> F, Pr: %f\n', length(find(alternativeRule10 == trueRule)) / length(stimuli));
  end
  if i == 2
    fprintf('Strategy: Z >  5      ==> F, Pr: %f (True Rule)\n', length(find(alternativeRule11 == trueRule)) / length(stimuli));
    fprintf('Strategy: Z <= 5      ==> F, Pr: %f (Should be 0)\n', length(find(alternativeRule12 == trueRule)) / length(stimuli));
  else
    fprintf('Strategy: Z >  5      ==> F, Pr: %f\n', length(find(alternativeRule11 == trueRule)) / length(stimuli));
    fprintf('Strategy: Z <= 5      ==> F, Pr: %f\n', length(find(alternativeRule12 == trueRule)) / length(stimuli));
  end
  
  blockNo = blockNo + 1;
end

fprintf('\n');
fprintf('Overlap of Block VI and Block VI is %f\n', length(find(trueRuleVI == trueRuleIV)) / length(stimuli));