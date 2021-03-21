
%remove increasing sequencies
/*
removeInc(l1l2..ln) = [],  n=0
                    = l1,  n=1
                    = [],  n=2, l1<l2
                    = removeInc(l2..ln), l1<l2<l3
                    = removeInc(l3..ln), l1<l2>=l3
                    = l1 U removeInc(l2..ln),  otherwise
*/

% removeInc(L:list, R:list)
% flow model: (i,o) or (i,i)
% L – list from which we remove the increasing sequences
% R – resulting list
removeInc([], []).
removeInc([H], [H]).
removeInc([H1,H2], []):- H1 < H2.
removeInc([H1,H2,H3|T], R):-
                  H1 < H2,
                  H2 < H3,
                  removeInc([H2,H3|T], R).
removeInc([H1,H2,H3|T], R):-
                  H1 < H2,
                  H2 >= H3,
                  removeInc([H3|T], R).
removeInc([H1,H2|T], [H1|R]):-
                  H1 >= H2,
                  removeInc([H2|T], R).




% mountain(L:list, F:integer)
% flow model: (i,i)
% L – the list that we are checking
% F – a parameter that shows if we are at the increasing or decreasing part of
%the mountain.
mountain([_], 0).
mountain([H1,H2|T], 1):-
                  H1 < H2,
                  mountain([H2|T], 1).
mountain([H1,H2|T], 1):-
                  H1 >= H2,
                  mountain([H2|T], 0).
mountain([H1,H2|T], 0):-
                  H1 > H2,
                  mountain([H2|T], 0).
% n>2 [A,B|_], l1<l2,  mountain(L,1)


mount_aux([_],0).
mount_aux([L1,L2|T],1):-L1<L2,mount_aux([L2|T],1).
mount_aux([L1,L2|T],_):-L1>L2,mount_aux([L2|T],0).
mount([L1,L2,L3|T]):-L1<L2, mount_aux([L1,L2,L3|T],1).
