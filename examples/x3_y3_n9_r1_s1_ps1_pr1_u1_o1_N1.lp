%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grid Size X:                      3
% Grid Size Y:                      3
% Number of Nodes:                  9
% Number of Robots:                 1
% Number of Shelves:                1
% Number of picking stations:       1
% Number of products:               1
% Number of product units in total: 1
% Number of orders:                 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

% init
init(object(node,1),value(at,(1,1))).
init(object(node,2),value(at,(2,1))).
init(object(node,3),value(at,(3,1))).
init(object(node,4),value(at,(1,2))).
init(object(node,5),value(at,(2,2))).
init(object(node,6),value(at,(3,2))).
init(object(node,7),value(at,(1,3))).
init(object(node,8),value(at,(2,3))).
init(object(node,9),value(at,(3,3))).
init(object(order,1),value(line,(1,1))).
init(object(order,1),value(pickingStation,1)).
init(object(pickingStation,1),value(at,(1,3))).
init(object(product,1),value(on,(1,1))).
init(object(robot,1),value(at,(2,3))).
init(object(shelf,1),value(at,(3,1))).
