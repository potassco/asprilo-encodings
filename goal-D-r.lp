#const rate=1.



 { process(A,O,S,T) : ordered(O,A), shelved(S,A) } rate :- time(T).

:- process(_,O,S,T), target(O,P), not serves(_,S,P,T).
:- process(_,O,S,T), target(O,P),     serves(R,S,P,T), not waits(R,T).

:- process(A,O,_,T), { process(A,O,_,T) : time(T), T<T } > 0.

processed(O) :- isOrder(O), process(A,O,_,_) : ordered(O,A).

:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).
:- position(P,C), position(_,C,horizon), isStation(P).
