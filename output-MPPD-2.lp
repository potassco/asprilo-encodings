#show.
#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
#show occurs(object(robot,R), action(pickup,()),  T) :  pickup(robot(R),  T).
#show occurs(object(robot,R), action(putdown,()), T) : putdown(robot(R),  T).
#show occurs(object(robot,R), action(deliver,()), T) : deliver(robot(R),  T).
