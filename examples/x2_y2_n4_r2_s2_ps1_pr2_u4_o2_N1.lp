%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grid Size X:                      2
% Grid Size Y:                      2
% Number of Nodes:                  4
% Number of Robots:                 2
% Number of Shelves:                2
% Number of picking stations:       1
% Number of products:               2
% Number of product units in total: 4
% Number of orders:                 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

% init
init(object(node,1),value(at,(1,1))).
init(object(node,2),value(at,(2,1))).
init(object(node,3),value(at,(1,2))).
init(object(node,4),value(at,(2,2))).
init(object(order,1),value(line,(1,1))).
init(object(order,1),value(pickingStation,1)).
init(object(order,2),value(line,(2,3))).
init(object(order,2),value(pickingStation,1)).
init(object(pickingStation,1),value(at,(2,1))).
init(object(product,1),value(on,(1,1))).
init(object(product,2),value(on,(1,3))).
init(object(robot,1),value(at,(1,1))).
init(object(robot,2),value(at,(2,1))).
init(object(shelf,1),value(at,(2,2))).
init(object(shelf,2),value(at,(1,2))).
