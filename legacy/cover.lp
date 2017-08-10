
orderedProduct(A) :- ordered(O,A).

{ covShelf(S) : ordered(_,A), shelved(S,A) }.
:- orderedProduct(A), { covShelf(S) : shelved(S,A) } < 1.

% #minimize { 1,S : covShelf(S) }. % direct encoding (aka hitting set)?


#show.
% #show orderedProduct/1.
#show covShelf/1.

%  8 % covShelf(shelf(9)). covShelf(shelf(8)).
% 10 % covShelf(shelf(12)). covShelf(shelf(11)). covShelf(shelf(14)). covShelf(shelf(8)).

:- carries(R,S,T), not covShelf(S).

% #heuristic covShelf(S). [20,factor]
% #heuristic covShelf(S). [2,false]

