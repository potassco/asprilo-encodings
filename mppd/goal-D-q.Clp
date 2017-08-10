#include "./quantities.clp".



processed(O) :- isOrder(O), &sum{ ordered(O,A,horizon) : ordered(O,A) } = 0.


:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).

:- &sum { positionX(R,horizon) } = X,
   &sum { positionY(R,horizon) } = Y, position(P,(X,Y)), isStation(P), isRobot(R).
