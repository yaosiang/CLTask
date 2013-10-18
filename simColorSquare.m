function simColorSquare(nLoops)

tic;
for i = 1:nLoops
  if exist([num2str(i) '.fig'], 'file')
    delete([num2str(i) '.fig']);
  end
  h = plotColorSquare(4, {'none'}, 90);
  saveas(h, [num2str(i) '.fig'], 'fig');
end
rt = toc;
close all;

disp(['Time: ' num2str(rt)]);