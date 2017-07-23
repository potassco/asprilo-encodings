#const rate=1.



 { process(A,O,S,T) : ordered(O,A), shelved(S,A) } rate :- time(T).

:- process(_,O,S,T), target(O,P), not serves(_,S,P,T).
:- process(_,O,S,T), target(O,P),     serves(R,S,P,T), not waits(R,T).

:- process(A,O,_,t), { process(A,O,_,T') : time(T'), T'<t } > 0.

processed(O) :- isOrder(O), process(A,O,_,_) : ordered(O,A).

:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).

:- &sum { positionX(R,horizon) } = X,
   &sum { positionY(R,horizon) } = Y, position(P,(X,Y)), isStation(P), isRobot(R).

