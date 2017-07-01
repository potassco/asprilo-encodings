
#show.
#show process/4.

%&show {  ordered(A,O,0) : ordered(O,A)                        }.
%&show {  ordered(A,O,T) : ordered(O,A),               time(T) }.
%&show {  shelved(S,A,0) : shelved(S,A)                        }.
%&show {  shelved(S,A,T) : shelved(S,A),               time(T) }.
%&show { amountPicked(A,O,S,T) : shelved(S,A), ordered(O,A), time(T) }.

