%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grid Size X:                      8
% Grid Size Y:                      8
% Number of Nodes:                  64
% Number of Robots:                 4
% Number of Shelves:                10
% Number of picking stations:       2
% Number of products:               3
% Number of product units in total: 16
% Number of orders:                 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% [old] clingo action-MPPD-2.lp strategy-MPPD-2.lp goal-MPPD-c.lp output-MPPD-2.lp examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp -c horizon=17
% [old] clingo action-MPPD-2.lp strategy-MPPD-2.lp goal-MPPD-b.lp output-MPPD-2.lp examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp -c horizon=18
% [old] clingo action-MPPD-3.lp strategy-MPPD-3.lp goal-MPPD-c.lp output-MPPD-3.lp examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp -c horizon=17
% [old] clingo action-MPPD-3.lp strategy-MPPD-3.lp goal-MPPD-b.lp output-MPPD-3.lp examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp -c horizon=18
% [old] ? clingo action-MPPD-2.lp strategy-MPPD-2.lp goal-a.lp  examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp -c horizon=29 quantities.lp
%
% [old] clingo   action-M.lp   examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp goal-M.lp  -c horizon=18
% [old] clingcon action-M.clp  examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp goal-M.clp -c horizon=18
% [old] clingo   action-M.ilp  examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp goal-M.ilp
% [old] clingcon action-M.iclp examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp goal-M.iclp
%
%*
clingo examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp  mppd/action-MPP.ilp mppd/goal-D-b.ilp                                             --stats \
clingo examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp  mppd/action-MPP.ilp mppd/goal-D-b.ilp mppd/strategy-MPP.ilp                       --stats \
clingo examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp  mppd/action-MPP.ilp mppd/goal-D-b.ilp mppd/strategy-MPP.ilp mppd/optimization.ilp --stats \
        --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2  \
        mppd/output-MPPD.ilp | head -n1 | visualizer

clingo control/assign.lp examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 | head -n1 | clingo mppd/action-MPP.ilp mppd/goal-D-b.ilp mppd/output-MPPD.ilp control/control.ilp - --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2                                     --stats
        mppd/output-MPPD.ilp | head -n1 | visualizer
*%
%
% clingo   xapf/action-M.lp   xapf/goal-M.lp   examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp -c horizon=17
% clingcon xapf/action-M.clp  xapf/goal-M.clp  examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp -c horizon=17
% clingo   xapf/action-M.ilp  xapf/goal-M.ilp  examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp 
% clingcon xapf/action-M.iclp xapf/goal-M.iclp examples/x8_y8_n64_r4_s10_ps2_pr3_u16_o4_N1.lp 
#program base.

% init
init(object(highway,1),value(at,(1,1))).
init(object(highway,5),value(at,(5,1))).
init(object(highway,8),value(at,(8,1))).
init(object(highway,9),value(at,(1,2))).
init(object(highway,10),value(at,(2,2))).
init(object(highway,11),value(at,(3,2))).
init(object(highway,12),value(at,(4,2))).
init(object(highway,13),value(at,(5,2))).
init(object(highway,14),value(at,(6,2))).
init(object(highway,15),value(at,(7,2))).
init(object(highway,16),value(at,(8,2))).
init(object(highway,17),value(at,(1,3))).
init(object(highway,21),value(at,(5,3))).
init(object(highway,24),value(at,(8,3))).
init(object(highway,25),value(at,(1,4))).
init(object(highway,29),value(at,(5,4))).
init(object(highway,32),value(at,(8,4))).
init(object(highway,33),value(at,(1,5))).
init(object(highway,34),value(at,(2,5))).
init(object(highway,35),value(at,(3,5))).
init(object(highway,36),value(at,(4,5))).
init(object(highway,37),value(at,(5,5))).
init(object(highway,38),value(at,(6,5))).
init(object(highway,39),value(at,(7,5))).
init(object(highway,40),value(at,(8,5))).
init(object(highway,41),value(at,(1,6))).
init(object(highway,45),value(at,(5,6))).
init(object(highway,48),value(at,(8,6))).
init(object(highway,49),value(at,(1,7))).
init(object(highway,50),value(at,(2,7))).
init(object(highway,51),value(at,(3,7))).
init(object(highway,52),value(at,(4,7))).
init(object(highway,53),value(at,(5,7))).
init(object(highway,54),value(at,(6,7))).
init(object(highway,55),value(at,(7,7))).
init(object(highway,56),value(at,(8,7))).
init(object(highway,57),value(at,(1,8))).
init(object(highway,58),value(at,(2,8))).
init(object(highway,59),value(at,(3,8))).
init(object(highway,60),value(at,(4,8))).
init(object(highway,61),value(at,(5,8))).
init(object(highway,62),value(at,(6,8))).
init(object(highway,63),value(at,(7,8))).
init(object(highway,64),value(at,(8,8))).
init(object(node,1),value(at,(1,1))).
init(object(node,2),value(at,(2,1))).
init(object(node,3),value(at,(3,1))).
init(object(node,4),value(at,(4,1))).
init(object(node,5),value(at,(5,1))).
init(object(node,6),value(at,(6,1))).
init(object(node,7),value(at,(7,1))).
init(object(node,8),value(at,(8,1))).
init(object(node,9),value(at,(1,2))).
init(object(node,10),value(at,(2,2))).
init(object(node,11),value(at,(3,2))).
init(object(node,12),value(at,(4,2))).
init(object(node,13),value(at,(5,2))).
init(object(node,14),value(at,(6,2))).
init(object(node,15),value(at,(7,2))).
init(object(node,16),value(at,(8,2))).
init(object(node,17),value(at,(1,3))).
init(object(node,18),value(at,(2,3))).
init(object(node,19),value(at,(3,3))).
init(object(node,20),value(at,(4,3))).
init(object(node,21),value(at,(5,3))).
init(object(node,22),value(at,(6,3))).
init(object(node,23),value(at,(7,3))).
init(object(node,24),value(at,(8,3))).
init(object(node,25),value(at,(1,4))).
init(object(node,26),value(at,(2,4))).
init(object(node,27),value(at,(3,4))).
init(object(node,28),value(at,(4,4))).
init(object(node,29),value(at,(5,4))).
init(object(node,30),value(at,(6,4))).
init(object(node,31),value(at,(7,4))).
init(object(node,32),value(at,(8,4))).
init(object(node,33),value(at,(1,5))).
init(object(node,34),value(at,(2,5))).
init(object(node,35),value(at,(3,5))).
init(object(node,36),value(at,(4,5))).
init(object(node,37),value(at,(5,5))).
init(object(node,38),value(at,(6,5))).
init(object(node,39),value(at,(7,5))).
init(object(node,40),value(at,(8,5))).
init(object(node,41),value(at,(1,6))).
init(object(node,42),value(at,(2,6))).
init(object(node,43),value(at,(3,6))).
init(object(node,44),value(at,(4,6))).
init(object(node,45),value(at,(5,6))).
init(object(node,46),value(at,(6,6))).
init(object(node,47),value(at,(7,6))).
init(object(node,48),value(at,(8,6))).
init(object(node,49),value(at,(1,7))).
init(object(node,50),value(at,(2,7))).
init(object(node,51),value(at,(3,7))).
init(object(node,52),value(at,(4,7))).
init(object(node,53),value(at,(5,7))).
init(object(node,54),value(at,(6,7))).
init(object(node,55),value(at,(7,7))).
init(object(node,56),value(at,(8,7))).
init(object(node,57),value(at,(1,8))).
init(object(node,58),value(at,(2,8))).
init(object(node,59),value(at,(3,8))).
init(object(node,60),value(at,(4,8))).
init(object(node,61),value(at,(5,8))).
init(object(node,62),value(at,(6,8))).
init(object(node,63),value(at,(7,8))).
init(object(node,64),value(at,(8,8))).
init(object(order,1),value(line,(1,1))).
init(object(order,1),value(pickingStation,1)).
init(object(order,2),value(line,(2,11))).
init(object(order,2),value(pickingStation,2)).
init(object(order,3),value(line,(3,1))).
init(object(order,3),value(pickingStation,1)).
init(object(order,4),value(line,(1,1))).
init(object(order,4),value(pickingStation,1)).
init(object(pickingStation,1),value(at,(8,1))).
init(object(pickingStation,2),value(at,(4,1))).
init(object(product,1),value(on,(4,1))).
init(object(product,1),value(on,(5,1))).
init(object(product,1),value(on,(6,1))).
init(object(product,1),value(on,(7,1))).
init(object(product,2),value(on,(8,8))).
init(object(product,2),value(on,(9,3))).
init(object(product,3),value(on,(10,1))).
init(object(robot,1),value(at,(4,8))).
init(object(robot,2),value(at,(2,8))).
init(object(robot,3),value(at,(3,8))).
init(object(robot,4),value(at,(1,8))).
init(object(shelf,1),value(at,(3,6))).
init(object(shelf,2),value(at,(3,3))).
init(object(shelf,3),value(at,(2,6))).
init(object(shelf,4),value(at,(4,4))).
init(object(shelf,5),value(at,(4,3))).
init(object(shelf,6),value(at,(7,6))).
init(object(shelf,7),value(at,(4,6))).
init(object(shelf,8),value(at,(2,4))).
init(object(shelf,9),value(at,(6,6))).
init(object(shelf,10),value(at,(7,4))).
