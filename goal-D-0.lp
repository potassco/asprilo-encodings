


processed(O,A) :- ordered(O,A), target(O,P), shelved(S,A), serves(R,S,P,T).


processed(O) :- isOrder(O), processed(O,A) : ordered(O,A).

:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).
:- position(P,C), position(_,C,horizon), isStation(P).
