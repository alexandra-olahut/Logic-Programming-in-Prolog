
%14.
/*
a. Write a predicate to test equality of
two sets without using the set difference.
*/
eqsets([],[]).
eqsets([H|T],S):-belongs(H,S),removeFirst(S,H,S2),eqsets(T,S2).

/*
b. Write a predicate to
select the n-th element of a given list.
*/
selectNth([L],N,L):-N>1,!.
selectNth([H|_],1,H):-!.
selectNth([_|T],N,R):-N1 is N-1,selectNth(T,N1,R).
