#const rate=1.

toShelf(S,C) :- shelved(S,A), ordered(O,A), target(O,P), position(P,C).



 { process(A,O,C,T) : ordered(O,A), target(O,P), position(P,C) } rate :- time(T).

processed(A,O,T) :- process(A,O,C,T).
processed(A,O,T) :- processed(A,O,T-1), time(T).

:- process(A,O,C,T), processed(A,O,T-1).



process(A,C,T) :- process(A,O,C,T).

:- process(A,C,T), not position(S,C,T-1) : shelved(S,A).

process(C,T) :- process(A,C,T).

:- process(C,T), position(S,C,T-1), toShelf(S,C), not carries(_,S,T-1).
:- process(C,T), position(R,C,T-1), isRobot(R), not waits(R,T).



:- ordered(O,A), not processed(A,O,horizon).

:- carries(_,_,horizon).

:- position(_,C), position(_,C,horizon).

% lexorder(A,O1,O2) :- ordered(O1,A), target(O1,P1), position(P1,C),
%                      ordered(O2,A), target(O2,P2), position(P2,C), O1 < O2,
%                      O <= O1 : ordered(O,A), target(O,P), position(P,C), O < O2.

% :- lexorder(A,O1,O2), process(A,O2,C,T), rate = 1, not processed(A,O1,T-1).
% :- lexorder(A,O1,O2), process(A,O2,C,T), rate > 1, not processed(A,O1,T).
