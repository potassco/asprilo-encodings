
 :- not serves(R,_,T-2), serves(R,_,T-1), { pickup(R,_,T); putdown(R,_,T); move(R,_,T) } > 0.

deliver(R,P,T) :- not serves(R,P,T-2), serves(R,P,T-1).
