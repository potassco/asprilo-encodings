
#show.
#show pick/4.

%&show {  amountMissing(A,O,0) : ordered(O,A)                        }.
%&show {  amountMissing(A,O,T) : ordered(O,A),               time(T) }.
%&show {  amountOnShelf(A,S,0) : onShelf(A,S)                        }.
%&show {  amountOnShelf(A,S,T) : onShelf(A,S),               time(T) }.
%&show { amountPicked(A,O,S,T) : onShelf(A,S), ordered(O,A), time(T) }.

