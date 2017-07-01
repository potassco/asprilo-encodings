
#const rate=1.

 { process(A,O,S,T) : ordered(O,A), shelved(S,A) } rate :- time(T).

:- process(_,O,_,T), target(O,P), not serves(_,P,T).
:- process(A,O,S,T), target(O,P),     serves(R,P,T), not carries(R,S,T).


processed(O) :- isOrder(O), process(A,O,_,_) : ordered(O,A).                               % No ordering

:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).
:- position(P,C), position(_,C,horizon), isStation(P).
