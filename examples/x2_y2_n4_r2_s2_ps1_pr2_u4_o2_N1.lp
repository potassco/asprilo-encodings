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
%
% clingo   action-MPP-2.lp  goal-D-0.lp   examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=5
% clingo   action-MPP-3.lp  goal-D-0.lp   examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=5
%
% clingo   action-MPP-2.ilp goal-D-0.ilp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp
% clingo   action-MPP-3.ilp goal-D-0.ilp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp
%
% clingo   action-MPP-2.lp  goal-D-r.lp   examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7
% clingo   action-MPP-3.lp  goal-D-r.lp   examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7
%
% clingo   action-MPP-2.ilp goal-D-r.ilp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp
% clingo   action-MPP-3.ilp goal-D-r.ilp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp
%
% clingo   action-MPP-2.lp  goal-D-q.lp   examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7
% clingo   action-MPP-3.lp  goal-D-q.lp   examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7
%
% clingcon action-MPP-2.lp  goal-D-q.clp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7
% clingcon action-MPP-3.lp  goal-D-q.clp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7
%
% clingo   action-MPP-2.ilp goal-D-q.ilp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp
% clingo   action-MPP-3.ilp goal-D-q.ilp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp
%
% clingcon action-MPP-2.ilp goal-D-q.iclp examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp 
% clingcon action-MPP-3.ilp goal-D-q.iclp examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp 
%
% clingo   action-M.lp      goal-M.lp     examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=6 --out-ifs='\n'

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
