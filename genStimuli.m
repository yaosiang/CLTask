function genStimuli(block, categoryPointNumber)

tic

count = 1;

switch block
  case 1
    categoryPoints = genCategoryPoints(4, {'none'}, categoryPointNumber);
  case 2
    categoryPoints = genCategoryPoints(1, {'z'}, categoryPointNumber);
  case 3
    categoryPoints = genCategoryPoints(1, {'y'}, categoryPointNumber);
  case 4
    categoryPoints = genCategoryPoints(5, {'none'}, categoryPointNumber);
end
while true
  if (round(var(categoryPoints(:, 1))) == 10) && (round(var(categoryPoints(:, 1))) == 10)
  
    if length(find(categoryPoints(:, 1) == 1)) / 90 >= (1 / 14) && ...
       length(find(categoryPoints(:, 1) == 1)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 1) == 2)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 1) == 2)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 1) == 3)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 1) == 3)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 1) == 4)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 1) == 4)) / 90 <= (1 / 8) && ...
       length(find(categoryPoints(:, 1) == 5)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 1) == 5)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 1) == 6)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 1) == 6)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 1) == 7)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 1) == 7)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 1) == 8)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 1) == 8)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 1) == 9)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 1) == 9)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 1) == 10)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 1) == 10)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 1) == 11)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 1) == 11)) / 90 <= (1 / 8)

     break;
   else
    switch block
      case 1
        categoryPoints = genCategoryPoints(4, {'none'}, categoryPointNumber);
      case 2
        categoryPoints = genCategoryPoints(1, {'z'}, categoryPointNumber);
      case 3
        categoryPoints = genCategoryPoints(1, {'y'}, categoryPointNumber);
      case 4
        categoryPoints = genCategoryPoints(5, {'none'}, categoryPointNumber);
    end
    showWaitingSymbol(count);
    count = count + 1;
   end
  else
    switch block
      case 1
        categoryPoints = genCategoryPoints(4, {'none'}, categoryPointNumber);
      case 2
        categoryPoints = genCategoryPoints(1, {'z'}, categoryPointNumber);
      case 3
        categoryPoints = genCategoryPoints(1, {'y'}, categoryPointNumber);
      case 4
        categoryPoints = genCategoryPoints(5, {'none'}, categoryPointNumber);
    end
    showWaitingSymbol(count);
    count = count + 1;
  end
end
xDim = categoryPoints(:, 1);

switch block
  case 1
    categoryPoints = genCategoryPoints(4, {'none'}, categoryPointNumber);
  case 2
    categoryPoints = genCategoryPoints(1, {'z'}, categoryPointNumber);
  case 3
    categoryPoints = genCategoryPoints(1, {'y'}, categoryPointNumber);
  case 4
    categoryPoints = genCategoryPoints(5, {'none'}, categoryPointNumber);
end
while true
  if (round(var(categoryPoints(:, 2))) == 10) && (round(var(categoryPoints(:, 2))) == 10)

    if length(find(categoryPoints(:, 2) == 1)) / 90 >= (1 / 14) && ...
       length(find(categoryPoints(:, 2) == 1)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 2) == 2)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 2) == 2)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 2) == 3)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 2) == 3)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 2) == 4)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 2) == 4)) / 90 <= (1 / 8) && ...
       length(find(categoryPoints(:, 2) == 5)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 2) == 5)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 2) == 6)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 2) == 6)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 2) == 7)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 2) == 7)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 2) == 8)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 2) == 8)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 2) == 9)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 2) == 9)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 2) == 10)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 2) == 10)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 2) == 11)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 2) == 11)) / 90 <= (1 / 8)

     break;
   else
    switch block
      case 1
        categoryPoints = genCategoryPoints(4, {'none'}, categoryPointNumber);
      case 2
        categoryPoints = genCategoryPoints(1, {'z'}, categoryPointNumber);
      case 3
        categoryPoints = genCategoryPoints(1, {'y'}, categoryPointNumber);
      case 4
        categoryPoints = genCategoryPoints(5, {'none'}, categoryPointNumber);
    end
    showWaitingSymbol(count);
    count = count + 1;
   end
  else
    switch block
      case 1
        categoryPoints = genCategoryPoints(4, {'none'}, categoryPointNumber);
      case 2
        categoryPoints = genCategoryPoints(1, {'z'}, categoryPointNumber);
      case 3
        categoryPoints = genCategoryPoints(1, {'y'}, categoryPointNumber);
      case 4
        categoryPoints = genCategoryPoints(5, {'none'}, categoryPointNumber);
    end
    showWaitingSymbol(count);
    count = count + 1;
  end
end
yDim = categoryPoints(:, 2);

switch block
  case 1
    categoryPoints = genCategoryPoints(4, {'none'}, categoryPointNumber);
  case 2
    categoryPoints = genCategoryPoints(1, {'z'}, categoryPointNumber);
  case 3
    categoryPoints = genCategoryPoints(1, {'y'}, categoryPointNumber);
  case 4
    categoryPoints = genCategoryPoints(5, {'none'}, categoryPointNumber);
end
while true
  if (round(var(categoryPoints(:, 3))) == 10) && (round(var(categoryPoints(:, 3))) == 10)

    if length(find(categoryPoints(:, 3) == 1)) / 90 >= (1 / 14) && ...
       length(find(categoryPoints(:, 3) == 1)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 3) == 2)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 3) == 2)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 3) == 3)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 3) == 3)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 3) == 4)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 3) == 4)) / 90 <= (1 / 8) && ...
       length(find(categoryPoints(:, 3) == 5)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 3) == 5)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 3) == 6)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 3) == 6)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 3) == 7)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 3) == 7)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 3) == 8)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 3) == 8)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 3) == 9)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 3) == 9)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 3) == 10)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 3) == 10)) / 90 <= (1 / 8)  && ...
       length(find(categoryPoints(:, 3) == 11)) / 90 >= (1 / 14)  && ...
       length(find(categoryPoints(:, 3) == 11)) / 90 <= (1 / 8)

     break;
   else
    switch block
      case 1
        categoryPoints = genCategoryPoints(4, {'none'}, categoryPointNumber);
      case 2
        categoryPoints = genCategoryPoints(1, {'z'}, categoryPointNumber);
      case 3
        categoryPoints = genCategoryPoints(1, {'y'}, categoryPointNumber);
      case 4
        categoryPoints = genCategoryPoints(5, {'none'}, categoryPointNumber);
    end
    showWaitingSymbol(count);
    count = count + 1;
   end
  else
    switch block
      case 1
        categoryPoints = genCategoryPoints(4, {'none'}, categoryPointNumber);
      case 2
        categoryPoints = genCategoryPoints(1, {'z'}, categoryPointNumber);
      case 3
        categoryPoints = genCategoryPoints(1, {'y'}, categoryPointNumber);
      case 4
        categoryPoints = genCategoryPoints(5, {'none'}, categoryPointNumber);
    end
    showWaitingSymbol(count);
    count = count + 1;
  end
end
zDim = categoryPoints(:, 3);

fprintf('\b');

stimuli = [xDim, yDim, zDim];
fprintf('\nVariance of X-dimension: %f\n', var(stimuli(:, 1)));
fprintf('Variance of Y-dimension: %f\n', var(stimuli(:, 2)));
fprintf('Variance of Z-dimension: %f\n', var(stimuli(:, 3)));

filename = strcat('stimuli', num2str(block), '.mat');
save(filename, 'stimuli');

fprintf('Time cost: %f seconds\n\n', toc);

function showWaitingSymbol(count)
if rem(count, 8) == 1
  fprintf('|');
end
if rem(count, 8) == 2
  fprintf('\b');
end
if rem(count, 8) == 3
  fprintf('/');
end
if rem(count, 8) == 4
  fprintf('\b');
end
if rem(count, 8) == 5
  fprintf('-');
end
if rem(count, 8) == 6
  fprintf('\b');
end
if rem(count, 8) == 7
  fprintf('\\');
end
if rem(count, 8) == 0
  fprintf('\b');
end