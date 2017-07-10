
processed(O,A) :- ordered(O,A), T < T', T' < T'', time(T), time(T'), time(T''), isRobot(R),
	       	  shelved(S,A), position(S,(X, Y ),0), &sum { positionX(R,T  ) } = X,  &sum{ positionY(R,T  ) } = Y ,
                   target(O,P), position(P,(X',Y')  ), &sum { positionX(R,T' ) } = X', &sum{ positionY(R,T' ) } = Y',
	       	                                       &sum { positionX(R,T'') } = X,  &sum{ positionY(R,T'') } = Y .

processed(O  ) :- isOrder(O), processed(O,A) : ordered(O,A).

:- not processed(O), isOrder(O).
