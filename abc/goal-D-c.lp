
instant(shelf(S)) :- position(shelf(S),C,0), position(_,C), strategy.



process(  A,O,C,T) :- ordered(O,A), target(O,P), position(P,C), shelved(S,A), not position(S,C,0),
                      position(S,C,T).
process(  A,O,C,T) :- ordered(O,A), target(O,P), position(P,C), shelved(S,A), position(S,C,0),
                      carries(_,S,T).
processed(A,  C)   :- process(A,O,C,T).




:- ordered(O,A), target(O,P), position(P,C), not processed(A,C).

:- carries(_,_,horizon).

:- position(_,C), position(_,C,horizon).
