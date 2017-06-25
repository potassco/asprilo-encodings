
:- serving(R,T), { pickup(R,T); putdown(R,T); move(R,T) } > 0.

 serving(R,T) :- serves(R,_,_,T).

deliver(R,P,T) :- serves(R,_,P,T).
deliver(R,  T) :- deliver(R,_,T).
