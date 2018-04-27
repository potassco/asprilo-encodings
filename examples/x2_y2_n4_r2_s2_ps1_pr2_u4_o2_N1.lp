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
% clingo   mppd/action-MPP.lp   mppd/goal-D-c.lp   examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=5
% clingo   mppd/action-MPP.ilp  mppd/goal-D-c.ilp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp
%
% clingo   mppd/action-MPP.lp   mppd/goal-D-b.lp   examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7
% clingo   mppd/action-MPP.ilp  mppd/goal-D-b.ilp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp
%
% clingo   mppd/action-MPP.lp   mppd/goal-D-a.lp   examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7
% clingcon mppd/action-MPP.lp   mppd/goal-D-a.clp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7
% clingo   mppd/action-MPP.ilp  mppd/goal-D-a.ilp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp
% clingcon mppd/action-MPP.ilp  mppd/goal-D-a.iclp examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp
%
% clingcon mppd/action-MPP.clp  mppd/goal-D-a.Clp  examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7
% clingcon mppd/action-MPP.iclp mppd/goal-D-a.iClp examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp
%
% clingo   xapf/action-M.lp     xapf/goal-M.lp     examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=6
%
% clingo   mppd/action-MPP.lp   mppd/goal-D-a.lp   examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7  \
%          --outf=0 -V0 --out-atomf=%s. output-MPPD.lp | head -n1 | visualizer -t -
% clingo   mppd/action-MPP.lp   mppd/goal-D-a.lp   examples/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp -c horizon=7  \
%          --outf=0 -V0 --out-atomf=%s. output-MPPD.lp | head -n1 | clingo ~/local/lib/asprilo/checker/encodings/default/checker.lp -

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
