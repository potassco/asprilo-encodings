


processed(A,C) :- ordered(O,A), target(O,P), position(P,C), shelved(S,A), not position(S,C,0),
                  position(S,C,T).
processed(A,C) :- ordered(O,A), target(O,P), position(P,C), shelved(S,A), position(S,C,0),
                  carries(_,S,T).




:- ordered(O,A), target(O,P), position(P,C), not processed(A,C).

:- carries(_,_,horizon).

:- position(_,C), position(_,C,horizon).
