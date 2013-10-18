function p = getParameters

% Messages:
p.questionMsg = double('��������D�Ч�D�ժ̸߰ݡA�S�����D�Ы��ť����~��');
p.pracMsg = double('�Ы��ť���}�l�m�߶��q');
p.question2Msg = double('���չ���y�{�ܡH�S�����D�Ы��ť����~��');
p.block1Msg = double('�Ы��ť���}�l��������');
p.block2Msg = double('�еy���𮧡A��������ť����~��');
p.fixationMsg = '+';
p.readyMsg = 'READY';
p.correctMsg = double('���T');
p.errorMsg = double('���~');
p.thanksMsg = double('����w�����A�P�±z���ѻP�I�����N���~��');
p.escapeMsg = double('�бz��D�ժ̡A���¡I');

% Duration (secs):
p.ITI = 0.5;
p.fixationDuration = 1;

% Stimuli:
p.pracStimuliNo = 4;
p.stimuliNo = 90;

p.block1StimuliFilename = ['stimuli' filesep 'stimuli1.mat'];      % three-dimensions
p.block2StimuliFilename = ['stimuli' filesep 'stimuli2.mat'];      % one-dimension: Z
p.block3StimuliFilename = ['stimuli' filesep 'stimuli3.mat'];      % one-dimension: Y
p.block4StimuliFilename = ['stimuli' filesep 'stimuli4.mat'];      % three-dimensions

p.typeIXCategories = ['A', 'A', 'B', 'B', 'A', 'A', 'B', 'B'];
p.typeIYCategories = ['B', 'B', 'B', 'B', 'A', 'A', 'A', 'A'];
p.typeIZCategories = ['B', 'A', 'B', 'A', 'B', 'A', 'B', 'A'];

p.block1Categories = ['B', 'A', 'A', 'B', 'A', 'B', 'B', 'A'];
p.block2Categories = p.typeIZCategories;
p.block3Categories = p.typeIYCategories;
p.block4Categories = ['B', 'B', 'B', 'A', 'A', 'A', 'A', 'B'];

p.edgeVertexes = [11, 0, 0; 11, 0, 11; 0, 0, 0; 0, 0, 11; ...
                  11, 11, 0; 11, 11, 11; 0, 11, 0; 0, 11, 11];

p.criterion = 8;
p.maxTrialNo = 200;

% Output header:
p.header = 'Block Trial Target Category Response RT Accuracy';

% Colors:
p.foreColor = 255;
p.backColor = 0;

% Text size:
p.textSize = 24;

% Screen resolution (px):
p.screenWidth = 1024;
p.screenHeight = 768;
p.screenRefreshRate = 60;