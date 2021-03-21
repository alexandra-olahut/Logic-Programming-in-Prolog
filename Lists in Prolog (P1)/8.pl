
%8.
/*
a. Write a
predicate to determine if a list has even numbers of elements without
counting the elements from the list.
*/
even([]).
even([_,_|T]):-even(T).

/*
b. Write a predicate to delete
first occurrence of the minimum number from a list.
*/
%mini(L:list, M:integer) (i,o)(i,i)
mini([E],E).
mini([H|T],R):-mini(T,R),H>R,!.
mini([H|_],H).
%***
removeAll(L,E,R):-removeE(L,E,R).
removeFirst([],_,[]).
removeFirst([E|T],E,T):-!.
removeFirst([H|T],E,[H|R]):-removeFirst(T,E,R).
removeMin(L,R):-mini(L,M),removeFirst(L,M,R).

