#show.
#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
#show occurs(object(robot,R), action(pickup,()),  T) :  pickup(robot(R),_,T).
#show occurs(object(robot,R), action(putdown,()), T) : putdown(robot(R),_,T).
#show occurs(object(robot,R), action(deliver,()), T) : deliver(robot(R),_,T).
