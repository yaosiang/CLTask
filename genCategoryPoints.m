function categoryPoints = genCategoryPoints(type, dimension, categoryPointNumber)

% Make sure the length and the content of each input argument is correct:
assert(nargin == 3, ...
  'You must call this function with 3 arguments.');
assert(isnumeric(type) == 1, ...
  'Argument type must be an integer.');
assert(iscellstr(dimension), ...
  'Argument dimension must be a cell string.');
assert((length(dimension) <= 2) && ~isempty(dimension), ...
  'The length of argument dimension must be less than 2.');
assert((type == 1) || (type == 2) || (type == 3) || ...
  (type == 4) || (type == 5) || (type == 6), ...
  'Argument type must be either 1, 2, 3, 4, 5, or 6.');
if (type == 1)
  assert(length(dimension) == 1, 'The length of argument dimension must be 1.');
end
if (type == 2)
  assert(length(dimension) == 2, 'The length of argument dimension must be 2.');
end
if (type ~= 1) && (type ~= 2)
  assert(strcmp(dimension{1}, 'none'), 'Argument dimension must be none.');
end

if type == 1;
  if strcmp(dimension{1}, 'x'); categories = ['A', 'A', 'B', 'B', 'A', 'A', 'B', 'B']; end
  if strcmp(dimension{1}, 'y'); categories = ['B', 'B', 'B', 'B', 'A', 'A', 'A', 'A']; end
  if strcmp(dimension{1}, 'z'); categories = ['B', 'A', 'B', 'A', 'B', 'A', 'B', 'A']; end
end
if type == 2;
  if strcmp(dimension{1}, 'x') && strcmp(dimension{2}, 'y')
    categories = ['B', 'B', 'A', 'A', 'A', 'A', 'B', 'B'];
  end
  if strcmp(dimension{1}, 'y') && strcmp(dimension{2}, 'z')
    categories = ['A', 'B', 'A', 'B', 'B', 'A', 'B', 'A'];
  end
  if strcmp(dimension{1}, 'x') && strcmp(dimension{2}, 'z')
    categories = ['B', 'A', 'A', 'B', 'B', 'A', 'A', 'B'];
  end
end
if type == 3; categories = ['B', 'B', 'B', 'A', 'A', 'B', 'A', 'A']; end
if type == 4; categories = ['B', 'B', 'B', 'A', 'B', 'A', 'A', 'A']; end
if type == 5; categories = ['B', 'B', 'B', 'A', 'A', 'A', 'A', 'B']; end
if type == 6; categories = ['B', 'A', 'A', 'B', 'A', 'B', 'B', 'A']; end

vertexes = fullfact([11, 11, 11]);
edgeVertexes = [11, 0, 0; 11, 0, 11; 0, 0, 0; 0, 0, 11; ...
                11, 11, 0; 11, 11, 11; 0, 11, 0; 0, 11, 11];

randomizedSequence = randperm(length(vertexes));

validPointsOfCategoryA = [];
validPointsOfCategoryB = [];
for i = 1:length(vertexes)
  category = calCategory(edgeVertexes, categories, vertexes(randomizedSequence(i), :));
  if length(category) == 1
    if category == 'A'
      validPointsOfCategoryA = [validPointsOfCategoryA; vertexes(randomizedSequence(i), :)];
    else
      validPointsOfCategoryB = [validPointsOfCategoryB; vertexes(randomizedSequence(i), :)];
    end
  end
end

pointsOfCategoryA = validPointsOfCategoryA(1:(categoryPointNumber / 2), :);
pointsOfCategoryB = validPointsOfCategoryB(1:(categoryPointNumber / 2), :);
categoryPoints = [pointsOfCategoryA; pointsOfCategoryB];