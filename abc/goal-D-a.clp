#include "./quantities.clp".



:- ordered(O,A), &sum { ordered(O,A,horizon) } > 0.

:- carries(_,_,horizon).

:- position(_,C), position(_,C,horizon).
