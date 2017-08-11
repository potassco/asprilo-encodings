

:-    move(R,_,_), not assign(R,_,_).
:-  pickup(R,S,_), not assign(R,S,_).
:- putdown(R,S,_), not assign(R,S,_).

:- process(_,O,S,  _), target(O,P), not assign(_,S,P).
:- process(_,O,S,_,_), target(O,P), not assign(_,S,P).
