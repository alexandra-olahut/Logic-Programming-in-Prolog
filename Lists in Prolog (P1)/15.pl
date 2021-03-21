
%15.
/*
a. Write a predicate to
transform a list in a set, considering the first occurrence. Eg:
[1,2,3,1,2] is transform in [1,2,3].
*/
toSetOrdered([],[]).
toSetOrdered([H|T],[H|R]):-removeE(T,H,T2),toSetOrdered(T2,R).

/*
b. Write a predicate to decompose a
list in a list respecting the following: [list of even numbers list of
odd numbers] and also return the number of even numbers and the numbers
of odd numbers.
*/

oddList([],[]).
oddList([H|T],[H|R]):-H mod 2=:=1,!,oddList(T,R).
oddList([_|T],R):-oddList(T,R).

evenList([],[]).
evenList([H|T],[H|R]):-H mod 2=:=0,!,evenList(T,R).
evenList([_|T],R):-evenList(T,R).

nrOdd([],0).
nrOdd([H|T],R1):-H mod 2=:=1,!,nrOdd(T,R),R1 is R+1.
nrOdd([_|T],R):-nrOdd(T,R).

nrEven([],0).
nrEven([H|T],R1):-H mod 2=:=0,!,nrEven(T,R),R1 is R+1.
nrEven([_|T],R):-nrEven(T,R).

p15(L,NewL,NrO,NrE):-oddList(L,O),evenList(L,E),concatt(E,O,NewL),nrOdd(L,NrO),nrEven(L,NrE).
