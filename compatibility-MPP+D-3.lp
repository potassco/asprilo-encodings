
:- serves(R,_,_,T-1), { pickup(R,T); putdown(R,T); move(R,T) } > 0.

deliver(R,P,T) :- serves(R,_,P,T-1).

