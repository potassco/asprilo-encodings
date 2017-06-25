


delivered(O,A) :- ordered(O,A), target(O,P), onShelf(A,S), serves(R,S,P,T).                 % No time, no resources


processed(O  ) :- isOrder(O), delivered(O,A) : ordered(O,A).                                % No ordering

:- not processed(O), isOrder(O).

:- carrying(R,horizon), isRobot(R).
:- position(P,C), position(_,C,horizon), isStation(P).
