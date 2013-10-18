function p = getParameters

% Messages:
p.questionMsg = double('有任何問題請找主試者詢問，沒有問題請按空白鍵繼續');
p.pracMsg = double('請按空白鍵開始練習階段');
p.question2Msg = double('明白實驗流程嗎？沒有問題請按空白鍵繼續');
p.block1Msg = double('請按空白鍵開始正式實驗');
p.block2Msg = double('請稍做休息，完畢後按空白鍵繼續');
p.fixationMsg = '+';
p.readyMsg = 'READY';
p.correctMsg = double('正確');
p.errorMsg = double('錯誤');
p.thanksMsg = double('實驗已完成，感謝您的參與！按任意鍵繼續');
p.escapeMsg = double('請您找主試者，謝謝！');

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