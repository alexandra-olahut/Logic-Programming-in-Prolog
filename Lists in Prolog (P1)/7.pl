
%7.
/*
a. Write a predicate to compute the
intersection of two sets.
*/
intersect([],_,[]).
intersect([H|T],S2,R):-not(belongs(H,S2)),!,intersect(T,S2,R).
intersect([H|T],S2,[H|R]):-intersect(T,S2,R).

/*
b. Write a predicate to create a list (m, ...,
n) of all integer numbers from the interval [m, n].

    interval(m,n) = false, m>n
                  = [m], m=n
                  = m U interval(m+1,n) otherwise
*/
%interval(M,N,R:list)
%(i,i,o) (o,i,i) (i,i,i)
interval(N,N,[N]):-!.
interval(M,N,[M|R]):-M<N,M1 is M+1,interval(M1,N,R).
