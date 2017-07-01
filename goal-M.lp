


delivered(O,A) :- ordered(O,A), shelved(S,A), position(R,C, T ), position(S,C,0),
                                 target(O,P), position(R,C',T'), position(P,C'),  T < T'.

processed(O  ) :- isOrder(O), delivered(O,A) : ordered(O,A).

:- not processed(O), isOrder(O).


:- position(S,C), position(_,C,horizon), isStation(S).
