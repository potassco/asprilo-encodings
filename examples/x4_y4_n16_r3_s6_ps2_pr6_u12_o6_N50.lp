%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grid Size X:                      4
% Grid Size Y:                      4
% Number of Nodes:                  16
% Number of Robots:                 3
% Number of Shelves:                6
% Number of picking stations:       2
% Number of products:               6
% Number of product units in total: 12
% Number of orders:                 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% clingcon mppd/action-MPP.clp  mppd/goal-D-c.clp  examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp -c horizon=11
%
% clingo   mppd/action-MPP.lp   mppd/goal-D-b.lp   examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp -c horizon=13
% clingcon mppd/action-MPP.clp  mppd/goal-D-b.clp  examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp -c horizon=13
%
% clingo   mppd/action-MPP.lp   mppd/goal-D-b.lp   examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp -c horizon=13 strategy-MPP.lp
%
% clingo   mppd/action-MPP.ilp  mppd/goal-D-b.ilp  examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp
% clingcon mppd/action-MPP.iclp mppd/goal-D-b.iclp examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp
%
% clingo   mppd/action-MPP.ilp  mppd/goal-D-b.ilp  examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp strategy-MPP.ilp
% clingcon mppd/action-MPP.iclp mppd/goal-D-b.iclp examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp strategy-MPP.ilp
%
% clingo   mppd/action-MPP.lp   mppd/goal-D-a.lp   examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp -c horizon=19 strategy-MPP.lp
% clingcon mppd/action-MPP.lp   mppd/goal-D-a.clp  examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp -c horizon=19 strategy-MPP.lp
% clingcon mppd/action-MPP.clp  mppd/goal-D-a.Clp  examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp -c horizon=19 strategy-MPP.lp
%
%%%%
%
% clingo xapf/action-M.lp       xapf/goal-M.lp     examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp -c horizon=11
% clingo xapf/action-M.ilp      xapf/goal-M.ilp    examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp
%
%%%%
%
% clingo assign-a.lp  examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp              --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 | head -n1 |
%        clingcon mppd/action-MPP.iclp mppd/goal-D-a.iblp control.ilp - output-MPPD.ilp --outf=0 -V0 --out-atomf=%s.               | head -n1 > PLUMPS
%
#program base.

% init
init(object(node,1),value(at,(1,1))).
init(object(node,2),value(at,(2,1))).
init(object(node,3),value(at,(3,1))).
init(object(node,4),value(at,(4,1))).
init(object(node,5),value(at,(1,2))).
init(object(node,6),value(at,(2,2))).
init(object(node,7),value(at,(3,2))).
init(object(node,8),value(at,(4,2))).
init(object(node,9),value(at,(1,3))).
init(object(node,10),value(at,(2,3))).
init(object(node,11),value(at,(3,3))).
init(object(node,12),value(at,(4,3))).
init(object(node,13),value(at,(1,4))).
init(object(node,14),value(at,(2,4))).
init(object(node,15),value(at,(3,4))).
init(object(node,16),value(at,(4,4))).
init(object(order,1),value(line,(5,1))).
init(object(order,1),value(pickingStation,2)).
init(object(order,2),value(line,(4,1))).
init(object(order,2),value(pickingStation,2)).
init(object(order,3),value(line,(6,6))).
init(object(order,3),value(pickingStation,1)).
init(object(order,4),value(line,(1,1))).
init(object(order,4),value(pickingStation,2)).
init(object(order,5),value(line,(2,1))).
init(object(order,5),value(pickingStation,2)).
init(object(order,6),value(line,(3,1))).
init(object(order,6),value(pickingStation,2)).
init(object(pickingStation,1),value(at,(4,3))).
init(object(pickingStation,2),value(at,(2,3))).
init(object(product,1),value(on,(6,1))).
init(object(product,2),value(on,(6,1))).
init(object(product,3),value(on,(4,1))).
init(object(product,4),value(on,(5,1))).
init(object(product,5),value(on,(3,1))).
init(object(product,6),value(on,(1,2))).
init(object(product,6),value(on,(3,2))).
init(object(product,6),value(on,(4,3))).
init(object(robot,1),value(at,(4,2))).
init(object(robot,2),value(at,(3,2))).
init(object(robot,3),value(at,(3,3))).
init(object(shelf,1),value(at,(1,1))).
init(object(shelf,2),value(at,(1,4))).
init(object(shelf,3),value(at,(2,2))).
init(object(shelf,4),value(at,(3,2))).
init(object(shelf,5),value(at,(3,4))).
init(object(shelf,6),value(at,(4,1))).
