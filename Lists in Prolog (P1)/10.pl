
%10.
/*
a. Define a
predicate to test if a list of integer elements has a "valley" aspect
(a set has a "valley" aspect if elements decreases up to a certain
point, and then increases. eg: 10 8 6 9 11 13 – has a “valley” aspect
*/
valley_aux([_],1).
valley_aux([L1,L2|T],0):-L1>L2,valley_aux([L2|T],0).
valley_aux([L1,L2|T],_):-L1<L2,valley_aux([L2|T],1).
valley([L1,L2,L3|T]):-L1>L2, valley_aux([L1,L2,L3|T],0).

/*b.
Calculate the alternate sum of list’s elements (l1 - l2 + l3 ...).
   alternate(l1..ln) = 0, n=0
                     = l1, n=1
                     = l1-l2+alternate(l3..ln) otherwise
*/
alternate([],0).
alternate([A],A).
alternate([L1,L2|T],R):-alternate(T,R1),R is R1+L1-L2.

