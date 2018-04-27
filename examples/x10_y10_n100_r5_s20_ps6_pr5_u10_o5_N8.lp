%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grid Size X:                      10
% Grid Size Y:                      10
% Number of Nodes:                  100
% Number of Robots:                 5
% Number of Shelves:                20
% Number of picking stations:       6
% Number of products:               5
% Number of product units in total: 10
% Number of orders:                 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% clingcon action-M.clp  examples/x10_y10_n100_r5_s20_ps6_pr5_u10_o5_N8.lp goal-M.clp -c horizon=27
% clingo   action-M.ilp  examples/x10_y10_n100_r5_s20_ps6_pr5_u10_o5_N8.lp goal-M.ilp 
% clingcon action-M.iclp examples/x10_y10_n100_r5_s20_ps6_pr5_u10_o5_N8.lp goal-M.iclp 
%
% clingo   mppd/action-MPP.ilp   mppd/goal-D-b.ilp   mppd/output-MPPD.lp examples/x10_y10_n100_r5_s20_ps6_pr5_u10_o5_N8.lp
% clingo   mppd/action-MPP.ilp   mppd/goal-D-b.ilp   mppd/output-MPPD.lp examples/x10_y10_n100_r5_s20_ps6_pr5_u10_o5_N8.lp mppd/strategy-MPP.ilp
%* clingo control/assign.lp examples/x10_y10_n100_r5_s20_ps6_pr5_u10_o5_N8.lp --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 | head -n1 | \
   clingo  mppd/action-MPP.ilp   mppd/goal-D-b.ilp    mppd/output-MPPD.ilp control/control.lp - --outf=0 -V0 --out-atomf=%s.                  --quiet=1,2,2 | head -n1
   clingo  mppd/action-MPP.ilp   mppd/goal-D-b.ilp    mppd/output-MPPD.ilp control/control.lp - --outf=0 -V0 --out-atomf=%s. optimization.lp  --quiet=1,2,2 | head -n1
*%
%
% clingo   mppd/action-MPP.lp   mppd/goal-D-b.lp   mppd/output-MPPD.lp examples/x10_y10_n100_r5_s20_ps6_pr5_u10_o5_N8.lp -c horizon=22
% clingo   mppd/action-MPP.lp   mppd/goal-D-b.lp   mppd/output-MPPD.lp examples/x10_y10_n100_r5_s20_ps6_pr5_u10_o5_N8.lp -c horizon=22 mppd/strategy-MPP.lp
%* clingo control/assign.lp examples/x10_y10_n100_r5_s20_ps6_pr5_u10_o5_N8.lp --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 | head -n1 | \
   clingo  mppd/action-MPP.lp   mppd/goal-D-b.lp    mppd/output-MPPD.lp control/control.lp - --outf=0 -V0 --out-atomf=%s.                  --quiet=1,2,2  -c horizon=23 | head -n1
   clingo  mppd/action-MPP.lp   mppd/goal-D-b.lp    mppd/output-MPPD.lp control/control.lp - --outf=0 -V0 --out-atomf=%s. optimization.lp  --quiet=1,2,2  -c horizon=23 | head -n1
*%
#program base.

% init
init(object(highway,1),value(at,(1,1))).
init(object(highway,6),value(at,(6,1))).
init(object(highway,10),value(at,(10,1))).
init(object(highway,11),value(at,(1,2))).
init(object(highway,12),value(at,(2,2))).
init(object(highway,13),value(at,(3,2))).
init(object(highway,14),value(at,(4,2))).
init(object(highway,15),value(at,(5,2))).
init(object(highway,16),value(at,(6,2))).
init(object(highway,17),value(at,(7,2))).
init(object(highway,18),value(at,(8,2))).
init(object(highway,19),value(at,(9,2))).
init(object(highway,20),value(at,(10,2))).
init(object(highway,21),value(at,(1,3))).
init(object(highway,26),value(at,(6,3))).
init(object(highway,30),value(at,(10,3))).
init(object(highway,31),value(at,(1,4))).
init(object(highway,36),value(at,(6,4))).
init(object(highway,40),value(at,(10,4))).
init(object(highway,41),value(at,(1,5))).
init(object(highway,46),value(at,(6,5))).
init(object(highway,50),value(at,(10,5))).
init(object(highway,51),value(at,(1,6))).
init(object(highway,52),value(at,(2,6))).
init(object(highway,53),value(at,(3,6))).
init(object(highway,54),value(at,(4,6))).
init(object(highway,55),value(at,(5,6))).
init(object(highway,56),value(at,(6,6))).
init(object(highway,57),value(at,(7,6))).
init(object(highway,58),value(at,(8,6))).
init(object(highway,59),value(at,(9,6))).
init(object(highway,60),value(at,(10,6))).
init(object(highway,61),value(at,(1,7))).
init(object(highway,66),value(at,(6,7))).
init(object(highway,70),value(at,(10,7))).
init(object(highway,71),value(at,(1,8))).
init(object(highway,76),value(at,(6,8))).
init(object(highway,80),value(at,(10,8))).
init(object(highway,81),value(at,(1,9))).
init(object(highway,82),value(at,(2,9))).
init(object(highway,83),value(at,(3,9))).
init(object(highway,84),value(at,(4,9))).
init(object(highway,85),value(at,(5,9))).
init(object(highway,86),value(at,(6,9))).
init(object(highway,87),value(at,(7,9))).
init(object(highway,88),value(at,(8,9))).
init(object(highway,89),value(at,(9,9))).
init(object(highway,90),value(at,(10,9))).
init(object(highway,91),value(at,(1,10))).
init(object(highway,92),value(at,(2,10))).
init(object(highway,93),value(at,(3,10))).
init(object(highway,94),value(at,(4,10))).
init(object(highway,95),value(at,(5,10))).
init(object(highway,96),value(at,(6,10))).
init(object(highway,97),value(at,(7,10))).
init(object(highway,98),value(at,(8,10))).
init(object(highway,99),value(at,(9,10))).
init(object(highway,100),value(at,(10,10))).
init(object(node,1),value(at,(1,1))).
init(object(node,2),value(at,(2,1))).
init(object(node,3),value(at,(3,1))).
init(object(node,4),value(at,(4,1))).
init(object(node,5),value(at,(5,1))).
init(object(node,6),value(at,(6,1))).
init(object(node,7),value(at,(7,1))).
init(object(node,8),value(at,(8,1))).
init(object(node,9),value(at,(9,1))).
init(object(node,10),value(at,(10,1))).
init(object(node,11),value(at,(1,2))).
init(object(node,12),value(at,(2,2))).
init(object(node,13),value(at,(3,2))).
init(object(node,14),value(at,(4,2))).
init(object(node,15),value(at,(5,2))).
init(object(node,16),value(at,(6,2))).
init(object(node,17),value(at,(7,2))).
init(object(node,18),value(at,(8,2))).
init(object(node,19),value(at,(9,2))).
init(object(node,20),value(at,(10,2))).
init(object(node,21),value(at,(1,3))).
init(object(node,22),value(at,(2,3))).
init(object(node,23),value(at,(3,3))).
init(object(node,24),value(at,(4,3))).
init(object(node,25),value(at,(5,3))).
init(object(node,26),value(at,(6,3))).
init(object(node,27),value(at,(7,3))).
init(object(node,28),value(at,(8,3))).
init(object(node,29),value(at,(9,3))).
init(object(node,30),value(at,(10,3))).
init(object(node,31),value(at,(1,4))).
init(object(node,32),value(at,(2,4))).
init(object(node,33),value(at,(3,4))).
init(object(node,34),value(at,(4,4))).
init(object(node,35),value(at,(5,4))).
init(object(node,36),value(at,(6,4))).
init(object(node,37),value(at,(7,4))).
init(object(node,38),value(at,(8,4))).
init(object(node,39),value(at,(9,4))).
init(object(node,40),value(at,(10,4))).
init(object(node,41),value(at,(1,5))).
init(object(node,42),value(at,(2,5))).
init(object(node,43),value(at,(3,5))).
init(object(node,44),value(at,(4,5))).
init(object(node,45),value(at,(5,5))).
init(object(node,46),value(at,(6,5))).
init(object(node,47),value(at,(7,5))).
init(object(node,48),value(at,(8,5))).
init(object(node,49),value(at,(9,5))).
init(object(node,50),value(at,(10,5))).
init(object(node,51),value(at,(1,6))).
init(object(node,52),value(at,(2,6))).
init(object(node,53),value(at,(3,6))).
init(object(node,54),value(at,(4,6))).
init(object(node,55),value(at,(5,6))).
init(object(node,56),value(at,(6,6))).
init(object(node,57),value(at,(7,6))).
init(object(node,58),value(at,(8,6))).
init(object(node,59),value(at,(9,6))).
init(object(node,60),value(at,(10,6))).
init(object(node,61),value(at,(1,7))).
init(object(node,62),value(at,(2,7))).
init(object(node,63),value(at,(3,7))).
init(object(node,64),value(at,(4,7))).
init(object(node,65),value(at,(5,7))).
init(object(node,66),value(at,(6,7))).
init(object(node,67),value(at,(7,7))).
init(object(node,68),value(at,(8,7))).
init(object(node,69),value(at,(9,7))).
init(object(node,70),value(at,(10,7))).
init(object(node,71),value(at,(1,8))).
init(object(node,72),value(at,(2,8))).
init(object(node,73),value(at,(3,8))).
init(object(node,74),value(at,(4,8))).
init(object(node,75),value(at,(5,8))).
init(object(node,76),value(at,(6,8))).
init(object(node,77),value(at,(7,8))).
init(object(node,78),value(at,(8,8))).
init(object(node,79),value(at,(9,8))).
init(object(node,80),value(at,(10,8))).
init(object(node,81),value(at,(1,9))).
init(object(node,82),value(at,(2,9))).
init(object(node,83),value(at,(3,9))).
init(object(node,84),value(at,(4,9))).
init(object(node,85),value(at,(5,9))).
init(object(node,86),value(at,(6,9))).
init(object(node,87),value(at,(7,9))).
init(object(node,88),value(at,(8,9))).
init(object(node,89),value(at,(9,9))).
init(object(node,90),value(at,(10,9))).
init(object(node,91),value(at,(1,10))).
init(object(node,92),value(at,(2,10))).
init(object(node,93),value(at,(3,10))).
init(object(node,94),value(at,(4,10))).
init(object(node,95),value(at,(5,10))).
init(object(node,96),value(at,(6,10))).
init(object(node,97),value(at,(7,10))).
init(object(node,98),value(at,(8,10))).
init(object(node,99),value(at,(9,10))).
init(object(node,100),value(at,(10,10))).
init(object(order,1),value(line,(4,1))).
init(object(order,1),value(pickingStation,3)).
init(object(order,2),value(line,(3,1))).
init(object(order,2),value(pickingStation,5)).
init(object(order,3),value(line,(2,1))).
init(object(order,3),value(pickingStation,3)).
init(object(order,4),value(line,(1,1))).
init(object(order,4),value(pickingStation,4)).
init(object(order,5),value(line,(5,1))).
init(object(order,5),value(pickingStation,6)).
init(object(pickingStation,1),value(at,(1,1))).
init(object(pickingStation,2),value(at,(6,1))).
init(object(pickingStation,3),value(at,(4,1))).
init(object(pickingStation,4),value(at,(2,1))).
init(object(pickingStation,5),value(at,(8,1))).
init(object(pickingStation,6),value(at,(10,1))).
init(object(product,1),value(on,(8,1))).
init(object(product,2),value(on,(3,1))).
init(object(product,2),value(on,(14,1))).
init(object(product,2),value(on,(15,1))).
init(object(product,2),value(on,(16,1))).
init(object(product,2),value(on,(17,1))).
init(object(product,2),value(on,(20,1))).
init(object(product,3),value(on,(11,1))).
init(object(product,4),value(on,(12,1))).
init(object(product,5),value(on,(14,1))).
init(object(robot,1),value(at,(2,10))).
init(object(robot,2),value(at,(4,10))).
init(object(robot,3),value(at,(5,10))).
init(object(robot,4),value(at,(3,10))).
init(object(robot,5),value(at,(1,10))).
init(object(shelf,1),value(at,(7,3))).
init(object(shelf,2),value(at,(2,7))).
init(object(shelf,3),value(at,(2,5))).
init(object(shelf,4),value(at,(7,7))).
init(object(shelf,5),value(at,(7,4))).
init(object(shelf,6),value(at,(2,4))).
init(object(shelf,7),value(at,(9,7))).
init(object(shelf,8),value(at,(3,8))).
init(object(shelf,9),value(at,(8,4))).
init(object(shelf,10),value(at,(3,4))).
init(object(shelf,11),value(at,(8,5))).
init(object(shelf,12),value(at,(9,5))).
init(object(shelf,13),value(at,(3,5))).
init(object(shelf,14),value(at,(5,8))).
init(object(shelf,15),value(at,(8,8))).
init(object(shelf,16),value(at,(2,3))).
init(object(shelf,17),value(at,(4,7))).
init(object(shelf,18),value(at,(3,3))).
init(object(shelf,19),value(at,(8,7))).
init(object(shelf,20),value(at,(4,5))).
