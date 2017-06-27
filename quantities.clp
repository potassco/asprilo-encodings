% >>> addition to input.lp <<<
ordered(order(O),product(A),number(N)) :- init(object(order,O),   value(line,(A,N))).
onShelf(product(A),shelf(S),number(N)) :- init(object(product,A), value(on,  (S,N))).

% >>> addition to aspilro.lp <<<
served(P,T) :- serves(_,P,T).

#include "/home/torsten/local/lib/clingcon/csp.lp". % CHECK MAX

&dom{N..N} = amountMissing(A,O,0) :- ordered(O,A,number(N)).
&dom{0..N} = amountMissing(A,O,T) :- ordered(O,A,number(N)), time(T).
&dom{N..N} = amountOnShelf(A,S,0) :- onShelf(A,S,number(N)).
&dom{0..N} = amountOnShelf(A,S,T) :- onShelf(A,S,number(N)), time(T).

&dom{0..N} =  amountPicked(A,O,S,T) :- ordered(O,A,number(N)), onShelf(A,S), time(T). % >>> REPORT MAX!!! <<<
% aligning args with pick/4 - perhaps drop shelf

 { pick(A,O,S,T) : onShelf(A,S) } 1 :- ordered(O,A), time(T). % pick one article at a time?

pick(  O,  T) :- pick(_,O,_,T).
pick(A,  S,T) :- pick(A,_,S,T).
pick(A,O,  T) :- pick(A,O,_,T).

:- pick(O,T),     target(O,P), not served(P,T).
:- pick(A,O,S,T), target(O,P), serves(R,P,T), not carries(R,S,T).

:-     pick(A,O,S,T), onShelf(A,S),               &sum{ amountOnShelf(A,S,T-1); -amountOnShelf(A,S,T); -amountPicked(A,O,S,T) } != 0, time(T).
:-     pick(A,O,S,T),               ordered(O,A), &sum{ amountMissing(A,O,T-1); -amountMissing(A,O,T); -amountPicked(A,O,S,T) } != 0, time(T).
:-     pick(A,O,S,T),                             &sum{                                                 amountPicked(A,O,S,T) }  = 0, time(T).

:- not pick(A,  S,T), onShelf(A,S),               &sum{ amountOnShelf(A,S,T-1); -amountOnShelf(A,S,T)                         } != 0, time(T).
:- not pick(A,O,  T),               ordered(O,A), &sum{ amountMissing(A,O,T-1); -amountMissing(A,O,T)                         } != 0, time(T). % >>> REPORT MAX!!! <<<
:- not pick(A,O,S,T), onShelf(A,S), ordered(O,A), &sum{                                                 amountPicked(A,O,S,T) } != 0, time(T).
%*
:-                    onShelf(A,S),               &sum{ amountOnShelf(A,S,T-1); -amountOnShelf(A,S,T)                         }  < 0, time(T).
:-                                  ordered(O,A), &sum{ amountMissing(A,O,T-1); -amountMissing(A,O,T)                         }  < 0, time(T).
*%
