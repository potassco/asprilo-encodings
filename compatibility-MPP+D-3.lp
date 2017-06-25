
 :- not serves(R,_,_,T-2), serves(R,_,_,T-1), { pickup(R,_,T); putdown(R,_,T); move(R,_,T) } > 0.

deliver(R,P,T) :- not serves(R,_,P,T-2), serves(R,_,P,T-1).
