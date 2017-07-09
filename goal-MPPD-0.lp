



process(O,A) :- ordered(O,A), target(O,P), shelved(S,A), serves(R,S,P,T).    % No time, no resources






processed(O) :- isOrder(O), process(O,A) : ordered(O,A).                                   % No ordering

:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).
:- position(P,C), position(_,C,horizon), isStation(P).
