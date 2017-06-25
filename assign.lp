%*
#include "./input.lp".


% assign order to one or more robots, ie, bring one or more shelfs to a designated picking station, en bloc

1 { assign(robot(R),S,T) : robot(R) } :- order(O'), O=order(O'), target(O,T), ordered(O,A), onShelf(A,S).

:- assign(R,S,T), assign(R',S,T), R<R'.

#maximize{1,R:assign(R,_,_)}.

#show assign/3.
#show order/1.

% How to solve incrementally several goals, viz checkpoints etc
% Ho wto state even for one robot succinctly "before" constraints, or even "sequence"
*%

assign(robot(1),shelf(9),station(2)).
assign(robot(2),shelf(8),station(1)).

:- carries(R,S,T), not assign(R,S,_).
:-  serves(R,P,T), not assign(R,_,P).
:-      move(R,T), not assign(R,_,_).
