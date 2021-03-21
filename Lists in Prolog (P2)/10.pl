
%10.
/*
a. For a list of integer numbers, define a predicate to write twice in list every prime number.
*/
duplicatePrime([],[]).
duplicatePrime([H|T],[H,H|R]):-prim(H),!,duplicatePrime(T,R).
duplicatePrime([H|T],[H|R]):-duplicatePrime(T,R).
