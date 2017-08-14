%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grid Size X:                      12
% Grid Size Y:                      5
% Number of Nodes:                  52
% Number of Robots:                 30
% Number of Shelves:                30
% Number of picking stations:       0
% Number of products:               0
% Number of product units in total: 0
% Number of orders:                 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

% init
init(object(node,1),value(at,(1,1))).
init(object(node,2),value(at,(2,1))).
init(object(node,3),value(at,(3,1))).
init(object(node,4),value(at,(4,1))).
init(object(node,5),value(at,(5,1))).
init(object(node,8),value(at,(8,1))).
init(object(node,9),value(at,(9,1))).
init(object(node,10),value(at,(10,1))).
init(object(node,11),value(at,(11,1))).
init(object(node,12),value(at,(12,1))).
init(object(node,13),value(at,(1,2))).
init(object(node,14),value(at,(2,2))).
init(object(node,15),value(at,(3,2))).
init(object(node,16),value(at,(4,2))).
init(object(node,17),value(at,(5,2))).
init(object(node,20),value(at,(8,2))).
init(object(node,21),value(at,(9,2))).
init(object(node,22),value(at,(10,2))).
init(object(node,23),value(at,(11,2))).
init(object(node,24),value(at,(12,2))).
init(object(node,25),value(at,(1,3))).
init(object(node,26),value(at,(2,3))).
init(object(node,27),value(at,(3,3))).
init(object(node,28),value(at,(4,3))).
init(object(node,29),value(at,(5,3))).
init(object(node,30),value(at,(6,3))).
init(object(node,31),value(at,(7,3))).
init(object(node,32),value(at,(8,3))).
init(object(node,33),value(at,(9,3))).
init(object(node,34),value(at,(10,3))).
init(object(node,35),value(at,(11,3))).
init(object(node,36),value(at,(12,3))).
init(object(node,37),value(at,(1,4))).
init(object(node,38),value(at,(2,4))).
init(object(node,39),value(at,(3,4))).
init(object(node,40),value(at,(4,4))).
init(object(node,41),value(at,(5,4))).
init(object(node,44),value(at,(8,4))).
init(object(node,45),value(at,(9,4))).
init(object(node,46),value(at,(10,4))).
init(object(node,47),value(at,(11,4))).
init(object(node,48),value(at,(12,4))).
init(object(node,49),value(at,(1,5))).
init(object(node,50),value(at,(2,5))).
init(object(node,51),value(at,(3,5))).
init(object(node,52),value(at,(4,5))).
init(object(node,53),value(at,(5,5))).
init(object(node,56),value(at,(8,5))).
init(object(node,57),value(at,(9,5))).
init(object(node,58),value(at,(10,5))).
init(object(node,59),value(at,(11,5))).
init(object(node,60),value(at,(12,5))).
init(object(robot,1),value(at,(4,3))).
init(object(robot,2),value(at,(5,2))).
init(object(robot,3),value(at,(2,2))).
init(object(robot,4),value(at,(8,4))).
init(object(robot,5),value(at,(6,3))).
init(object(robot,6),value(at,(2,3))).
init(object(robot,7),value(at,(4,1))).
init(object(robot,8),value(at,(10,5))).
init(object(robot,9),value(at,(10,3))).
init(object(robot,10),value(at,(12,2))).
init(object(robot,11),value(at,(5,5))).
init(object(robot,12),value(at,(1,2))).
init(object(robot,13),value(at,(9,4))).
init(object(robot,14),value(at,(8,1))).
init(object(robot,15),value(at,(2,5))).
init(object(robot,16),value(at,(11,1))).
init(object(robot,17),value(at,(12,3))).
init(object(robot,18),value(at,(9,3))).
init(object(robot,19),value(at,(10,1))).
init(object(robot,20),value(at,(12,5))).
init(object(robot,21),value(at,(1,1))).
init(object(robot,22),value(at,(5,4))).
init(object(robot,23),value(at,(8,5))).
init(object(robot,24),value(at,(11,2))).
init(object(robot,25),value(at,(9,5))).
init(object(robot,26),value(at,(9,2))).
init(object(robot,27),value(at,(11,4))).
init(object(robot,28),value(at,(9,1))).
init(object(robot,29),value(at,(8,2))).
init(object(robot,30),value(at,(2,4))).
init(object(shelf,1),value(at,(12,1))).
init(object(shelf,2),value(at,(3,2))).
init(object(shelf,3),value(at,(5,4))).
init(object(shelf,4),value(at,(2,2))).
init(object(shelf,5),value(at,(11,1))).
init(object(shelf,6),value(at,(4,2))).
init(object(shelf,7),value(at,(3,5))).
init(object(shelf,8),value(at,(4,5))).
init(object(shelf,9),value(at,(1,1))).
init(object(shelf,10),value(at,(5,5))).
init(object(shelf,11),value(at,(12,5))).
init(object(shelf,12),value(at,(10,5))).
init(object(shelf,13),value(at,(9,5))).
init(object(shelf,14),value(at,(8,5))).
init(object(shelf,15),value(at,(2,5))).
init(object(shelf,16),value(at,(12,4))).
init(object(shelf,17),value(at,(10,4))).
init(object(shelf,18),value(at,(4,4))).
init(object(shelf,19),value(at,(2,4))).
init(object(shelf,20),value(at,(1,4))).
init(object(shelf,21),value(at,(12,3))).
init(object(shelf,22),value(at,(8,3))).
init(object(shelf,23),value(at,(6,3))).
init(object(shelf,24),value(at,(4,3))).
init(object(shelf,25),value(at,(2,3))).
init(object(shelf,26),value(at,(1,3))).
init(object(shelf,27),value(at,(12,2))).
init(object(shelf,28),value(at,(10,2))).
init(object(shelf,29),value(at,(9,2))).
init(object(shelf,30),value(at,(8,2))).
