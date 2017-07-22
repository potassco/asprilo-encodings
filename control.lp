:-    move(R,_,T), not assign(R,_,_).
:-  pickup(R,S,T), not assign(R,S,_).
:- putdown(R,S,T), not assign(R,S,_).
