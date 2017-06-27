#show.
#show init/2.



#show occurs(object(robot,R), action(move,D),     T)      :    move(robot(R),D,T).
#show occurs(object(robot,R), action(pickup,()),  T)      :  pickup(robot(R),_,T).
#show occurs(object(robot,R), action(putdown,()), T)      : putdown(robot(R),_,T).
#show occurs(object(robot,R), action(deliver,(O,A  )), T) : deliver(robot(R),P,T), ordered(order(O),product(A)), target(order(O),P), onShelf(product(A),S), serves(robot(R),P,T), carries(robot(R),S,T).
#show occurs(object(robot,R), action(deliver,(O,A,N)), T) : deliver(robot(R),P,T), pick(product(A),order(O),S,T), amountPicked(product(A),order(O),S,N,T).
