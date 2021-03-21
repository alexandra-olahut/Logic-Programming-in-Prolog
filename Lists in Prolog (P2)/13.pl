
%13.
/*
a. Given a linear numerical list write a predicate to remove all sequences of consecutive values.
Eg.: remove([1, 2, 4, 6, 7, 8, 10], L) will produce L=[4, 10].
*/
consecutive(A,B):-A=:=B-1.
removeConsec([E],[E]).
removeConsec([H1,H2],[]):-consecutive(H1,H2).
removeConsec([H1,H2|T],[H1|R]):-not(consecutive(H1,H2)),!,
                                   removeConsec([H2|T],R).
removeConsec([_,H2,H3|T],R):-consecutive(H2,H3),
                             removeConsec([H2,H3|T],R).
removeConsec([_,H2,H3|T],R):-not(consecutive(H2,H3)),
                             removeConsec([H3|T],R).
