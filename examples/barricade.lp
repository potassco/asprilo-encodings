%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grid size X: 4
%Grid size Y: 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% clingo action-MPP-3.ilp goal-D-b.ilp optimization-3.ilp barricade.lp output-MPPD-3.ilp --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 | head -n1 | visualizer
% clingo assign.lp barricade.lp




#program base.

%init
init(object(node, 1), value(at, (1, 1))).
init(object(node, 5), value(at, (1, 2))).
init(object(node, 9), value(at, (1, 3))).
init(object(node, 13), value(at, (1, 4))).
init(object(node, 2), value(at, (2, 1))).
init(object(node, 6), value(at, (2, 2))).
init(object(node, 10), value(at, (2, 3))).
init(object(node, 14), value(at, (2, 4))).
init(object(node, 3), value(at, (3, 1))).
init(object(node, 7), value(at, (3, 2))).
init(object(node, 11), value(at, (3, 3))).
init(object(node, 15), value(at, (3, 4))).
init(object(node, 4), value(at, (4, 1))).
init(object(node, 8), value(at, (4, 2))).
init(object(node, 12), value(at, (4, 3))).
init(object(node, 16), value(at, (4, 4))).
init(object(pickingStation,1), value(at,(1,1))).
init(object(robot,1), value(at,(1,2))).
init(object(robot,3), value(at,(2,1))).
init(object(robot,2), value(at,(2,2))).
init(object(robot,4), value(at,(3,3))).
init(object(shelf,1), value(at,(4,4))).

init(object(order,1),value(line,(1,1))).
init(object(order,1),value(pickingStation,1)).
init(object(product,1),value(on,(1,1))).
