#!/bin/bash

# ENCODINGS="action-MPP-3.lp goal-D-r.lp output-MPPD-3.lp -c horizon=$2"
ENCODINGS="xapf/action-M.ilp   xapf/goal-m.ilp"
# VISUALIZER="--outf=0 -V0 --out-atomf=%s. | head -n1 | visualizer"

for f in $1/*.lp ;
do
    clingo $ENCODINGS $f;
done

# CALL="clingo1facts assign.lp $1 | clingo $ENCODINGS control.lp - $3 $VISUALIZER"
