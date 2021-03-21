%1
% combinari(l1...ln, k) =
%	[], k = 0
%	l1 + combinari(l2...ln, k - 1), k > 0
%	combinari(l2...ln, k), k > 0

% combinari(L:list, K:number, R:list)
% combinari(i, o)

combinari(_, 0, []).
combinari([H|T], K, [H|R]) :-
    K > 0,
    NK is K - 1,
    combinari(T, NK, R).
combinari([_|T], K, R) :-
    K > 0,
    combinari(T, K, R).

% allsolutions(L:list, N:number, R:list)
% allsolutions(i, i, o)

allsolutions1(L, N, R) :-
    findall(RPartial, combinari(L, N, RPartial), R).





%3
% write N as sum of consecutive numbers

sumConsec(N,Sol):-
    candidatN(N,Nr),
    sumConsec_aux(N,[Nr],Nr,Sol).
%sumConsec_aux(N,Col,Sum,R)
sumConsec_aux(N,Col,N,Col):-length(Col,L),L>1.
sumConsec_aux(N,[H|Col],Sum,R):-
    H>1,
    Candidat is H-1,
    Sum1 is Sum+Candidat,
    Sum1=<N,
    sumConsec_aux(N,[Candidat,H|Col],Sum1,R).






%4

sublists([],[]).
sublists([H|T],[H|R]):-sublists(T,R).
sublists([_|T],R):-sublists(T,R).
% Write a predicate to determine all sublists strictly ascending of this list a
%sublistsAsc([E],[E]).

sublistsAsc([H|_],[H]).
sublistsAsc([H|T],[H,Hr|R]):-sublistsAsc(T,[Hr|R]),H<Hr.
sublistsAsc([_|T],R):-sublistsAsc(T,R).
