function category = calCategory(edgeVertexes, categories, stimulus)

distances = sqrt(power((stimulus(1) - edgeVertexes(:, 1)), 2) + ...
                 power((stimulus(2) - edgeVertexes(:, 2)), 2) + ...
                 power((stimulus(3) - edgeVertexes(:, 3)), 2));

minDistanceNo = logical(distances == min(distances));
category = categories(minDistanceNo);