


processed(P,A) :- ordered(O,A), target(O,P), shelved(S,A), serves(R,S,P,_).




:- ordered(O,A), target(O,P), not processed(P,A).

:- carries(R,_,horizon), isRobot(R).

:- position(P,C), isStation(P), position(_,C,horizon).
