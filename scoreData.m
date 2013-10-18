% Clear all variables, figures and MATLAB console:
clc; clear all; close all;

if exist('clExpData.txt', 'file')
  response = questdlg('The file clExpData.txt already exists. Do you want to overwrite it?', ...
    'Duplicate Warning', 'Cancel', 'OK', 'Cancel');
  if strcmp(response, 'Cancel')
    error('Experiment aborted.');
  end
end

fid = fopen('clExpData.txt', 'wt');
fprintf('ID\tBlock1\tBlock2\tBlock3\tBlock4\n');
fprintf(fid, 'ID\tBlock1\tBlock2\tBlock3\tBlock4\n');

exp = getRawData;

% Calculate nTrial of each block:
for i = 1:length(exp.subject)
  exp.subject(i).nTrialsOfBlock1 = length(exp.subject(i).block(1).trial);
  exp.subject(i).nTrialsOfBlock2 = length(exp.subject(i).block(2).trial);
  exp.subject(i).nTrialsOfBlock3 = length(exp.subject(i).block(3).trial);
  exp.subject(i).nTrialsOfBlock4 = length(exp.subject(i).block(4).trial);

  fprintf('%d\t%d\t%d\t%d\t%d\n', ...
    str2double(exp.subject(i).Id), ...
    exp.subject(i).nTrialsOfBlock1, exp.subject(i).nTrialsOfBlock2, ...
    exp.subject(i).nTrialsOfBlock3, exp.subject(i).nTrialsOfBlock4);
  fprintf(fid, '%d\t%d\t%d\t%d\t%d\n', ...
    str2double(exp.subject(i).Id), ...
    exp.subject(i).nTrialsOfBlock1, exp.subject(i).nTrialsOfBlock2, ...
    exp.subject(i).nTrialsOfBlock3, exp.subject(i).nTrialsOfBlock4);
end
fclose(fid);