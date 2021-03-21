
%12.
/*
a. Define a predicate to add after every element from a list, the divisors of that number.
*/
divisor(1,_,[]).
divisor(N,N,[]):-!.
divisor(N,D,[D|R]):-N mod D=:=0,N=\=D,N=\=1,!,D2 is D+1,divisor(N,D2,R).
divisor(N,D,R):-D2 is D+1,divisor(N,D2,R).
divisors(N,Div):-divisor(N,2,Div).
addDivAfter([],[]).
addDivAfter([H|T],[H|Res]):-divisors(H,Div),addDivAfter(T,R),concatt(Div,R,Res).
