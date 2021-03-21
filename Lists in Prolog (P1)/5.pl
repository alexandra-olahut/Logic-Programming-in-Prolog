
%5.
/*
a. Write a predicate to
compute the union of two sets.
*/
union(S1,S2,R):-concatt(S1,S2,C),toSet(C,R).

/*
b. Write a predicate to determine the set
of all the pairs of elements in a list. Eg.: L = [a b c d] => [[a b] [a
c] [a d] [b c] [b d] [c d]].
    all_pairs(l1..ln) = pairs(l1,l2..ln)
                      = all_pairs(l2..ln)
    pairs(e,l1..ln) = [e,l1]
                    = pairs(e,l2..ln)
*/
pairs(E,[H|_],[E,H]).
pairs(E,[_|T],P):-pairs(E,T,P).
all_pairs([H|T],R):-pairs(H,T,R).
all_pairs([_|T],R):-all_pairs(T,R).
res_pairs(L,R):-findall(P,all_pairs(L,P),R).
