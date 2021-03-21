

%-------- numbers represented as lists

%predecessor
/*
 predecessor(l1..ln, b) = [], n=0
                         [9], b=1, n=1, l1=0
                         [l1-1], b=0, n=1, l1!=0
                         9 U predecessor(l2..ln, 1), b=1, l1=0
                         (l1-b) U predecessor(l2..ln,b), b=0
*/

% pred(L-list, B-number, R-list)
% flow model (i,i,o), (i,i,i)
% L - given number
% B - borrow from subtraction
% R - resulted predecessor
pred([], _, []) :- !.
pred([0], 1, [9]) :- !.
pred([N], 0, [NR]) :- NR is N - 1, !.
pred([0|T], 1, [9|R]) :-
    pred(T, 1, R), !.
pred([H|T], 0, [HR|R]) :-
    pred(T, B, R),
    HR is H - B.


% predecessor(L-list, R-list)
% flow model (i,o), (i,i)
% L - given number
% R - predecessor
predecessor(L, R):- pred(L, 0, [0|R]), !.
predecessor(L, [H|R]):- pred(L, 0, [H|R]), H=\=0.




%successor
/*
 successor(l1..ln, b) = [], n=0
                        [0], b=1, n=1, l1=9
                        [l1+1], b=0, n=1, l1!=9
                        0 U successor(l2..ln, 1), b=1, l1=9
                        (l1+b) U successor(l2..ln,b), b=0
*/

succ([],_,[]).
succ([9],1,[0]):-!.
%succ([9],0,[1,0]):-!.
succ([N],0,[Nr]):-Nr is N+1,!.
succ([9|T],1,[0|R]):-
                  succ(T,1,R),!.
succ([H|T],0,[HR|R]):-
                  succ(T,B,R),
                  HR is H+B,
                  HR<10,!.
%succ([_|T],0,[1,0|R]):-
%                  succ(T,_,R).
successor([9|T],R):-!,succ([0,9|T],0,R).
successor(L,R):-succ(L,0,R).



/*
main(L) = mul2(L,0), if it exists
        = 1 U mul2(L,1) otherwise
mul2(L,b) = [], b=0
          = () U mul2(l2..ln,b)
*/

%multiplied by 2 (x2)
mul2([],0,[]).
mul2([H|T],0,[HR|R]):-mul2(T,B,R),HR is H*2+B,HR<10,!.
mul2([H|T],1,[HR|R]):-mul2(T,B,R),HR is H*2+B-10.
mul2_main(L,R):-mul2(L,0,R),!.
mul2_main(L,[1|R]):-mul2(L,1,R).

