
#const rate=1. % picking rate, 0 stands fro simultaneous

%% processed(O,A  ) :- rate=0, ordered(O,A), target(O,P), shelved(S,A), serves(R,P,T), carries(R,S,T).   % No time, no resources

processed(O,A,T) :- ordered(O,A), target(O,P), shelved(S,A), serves(R,P,T), carries(R,S,T).   % No time, no resources %% rate > 0

:- { processed(O,A,T) : ordered(O,A) } > rate, rate>0, isOrder(O), time(T).



processed(O    ) :- isOrder(O), processed(O,A,_) : ordered(O,A).                                % No ordering

:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).
:- position(P,C), position(_,C,horizon), isStation(P).
