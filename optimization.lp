#minimize{ T@3,R,T : move(R,T)    ;
	   T@3,R,T : pickup(R,T)  ;
 	   T@3,R,T : putdown(R,T) ;
 	   T@3,R,T : deliver(R,T) }.

%*
wait(R,T) :- isRobot(R), time(T), not pickup(R, T), not putdown(R, T), not deliver(R, T), not move(R, T).

straight(R,T) :- move(R,D,T), move(R,D,T-1).

% #maximize{ 1@2,R,T : wait(R,T) }.
% #minimize{ 1@1,R,T : turn(R,T) }.
#maximize{ 1@1,R,T : straight(R,T) }.
*%

