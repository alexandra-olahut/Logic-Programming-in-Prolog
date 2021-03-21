
%3.
/*
a. Define a predicate to remove from a list all repetitive elements.
Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])
*/
removeRepetitive([],[]).
removeRepetitive([H|T],R):-belongs(H,T),!,removeE([H|T],H,L), removeRepetitive(L,R).
removeRepetitive([H|T],[H|R]):-removeRepetitive(T,R).

/*
b. Remove all occurrence of a maximum
value from a list on integer numbers.
*/
%maxi(L:list, M:integer) (i,o)(i,i)
maxi([E],E).
maxi([H|T],R):-maxi(T,R),H<R,!.
maxi([H|_],H).
removeMax(L,R):-maxi(L,M), removeE(L,M,R).
