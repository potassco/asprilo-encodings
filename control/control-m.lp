% - Control for Domain M ---------------------------------------------------------------------------

:- move(R,_,_), not assign(R,_,_).

:- processed(A,R), shelved(S,A), not assign(R,S,_).
