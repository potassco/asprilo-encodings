

:- highway(C), position(shelf(_),C,T).

wait(R,T) :- not pickup(R, T), not putdown(R, T), not deliver(R, T), not move(R,_,T), isRobot(R), time(T).

:- wait(R,T), position(R,C,T), highway(C).
