function exp = getRawData

% Input Data Section:
%
files = FileFromFolder('data');

% Read data file:
count = 1;
for i = 1:length(files)
  [pathstr, name, ext] = fileparts(files(i).name);

  if strcmp(ext, '.txt')
    filename = strcat('data', filesep, files(i).name);
    fid = fopen(filename, 'rt');

    isInfoSection = true;
    isDataSection = false;

    while true
      line = fgetl(fid);

      if ~ischar(line)
        break;
      else
        if isempty(line)
          isInfoSection = false;
        elseif regexpi(line, 'Block		Trial		Target		Category		Response		RT		Accuracy');
          isInfoSection = false;
        else
          if ~isInfoSection
            isDataSection = true;
          end
        end

        % Extract information of each subject:
        if isInfoSection
          if regexpi(line, '���ժ̽s��')
            exp.subject(count).Id = strtrim(regexprep(line, '���ժ̽s��: ', ''));
          end
          if regexpi(line, '����}�l�ɶ�')
            exp.subject(count).startTime = strtrim(regexprep(line, '����}�l�ɶ�: ', ''));
          end
          if regexpi(line, '���絲���ɶ�')
            exp.subject(count).endTime = strtrim(regexprep(line, '���絲���ɶ�: ', ''));
          end
          if regexpi(line, '����ӶO�ɶ�')
            exp.subject(count).timeCost = strtrim(regexprep(line, '����ӶO�ɶ�: ', ''));
          end
          if regexpi(line, '��E���ƹϧ�')
            exp.subject(count).stimulusType = strtrim(regexprep(line, '��E���ƹϧ�: ', ''));
          end
        end

        % Extract raw data of each subject:
        if isDataSection
          [blockName, trialNo, x, y, z, category, response, rt, accuracy] = strread(line, '%s %d [%d %d %d] %c %c %f %c');

          if strcmp(blockName, 'Block1')
            exp.subject(count).block(1).name = blockName;
            exp.subject(count).block(1).trial(trialNo).stimulus = [x, y, z];
            exp.subject(count).block(1).trial(trialNo).category = category;
            exp.subject(count).block(1).trial(trialNo).response = response;
            exp.subject(count).block(1).trial(trialNo).rt = rt;
            exp.subject(count).block(1).trial(trialNo).accuracy = accuracy;
          end

          if strcmp(blockName, 'Block2')
            exp.subject(count).block(2).name = blockName;
            exp.subject(count).block(2).trial(trialNo).stimulus = [x, y, z];
            exp.subject(count).block(2).trial(trialNo).category = category;
            exp.subject(count).block(2).trial(trialNo).response = response;
            exp.subject(count).block(2).trial(trialNo).rt = rt;
            exp.subject(count).block(2).trial(trialNo).accuracy = accuracy;
          end

          if strcmp(blockName, 'Block3')
            exp.subject(count).block(3).trial(trialNo).stimulus = [x, y, z];
            exp.subject(count).block(3).trial(trialNo).category = category;
            exp.subject(count).block(3).trial(trialNo).response = response;
            exp.subject(count).block(3).trial(trialNo).rt = rt;
            exp.subject(count).block(3).trial(trialNo).accuracy = accuracy;
          end

          if strcmp(blockName, 'Block4')
            exp.subject(count).block(4).trial(trialNo).stimulus = [x, y, z];
            exp.subject(count).block(4).trial(trialNo).category = category;
            exp.subject(count).block(4).trial(trialNo).response = response;
            exp.subject(count).block(4).trial(trialNo).rt = rt;
            exp.subject(count).block(4).trial(trialNo).accuracy = accuracy;
          end
        end
      end
    end
    fclose(fid);
    count = count + 1;
  end
end