domains
    list = integer*
predicates
    print(list)
    replace(list, integer, integer, list)
clauses
    print([]) :- !.
    print([H|[]]) :- write(H).
    print([H|T]) :- write(H, ", "), print(T).
 
    replace([], _, _, []) :- !.
    replace([H|T], X, Y, [H|R]) :- H <> X, replace(T, X, Y, R).
    replace([H|T], X, Y, [Y|R]) :- H = X, replace(T, X, Y, R).
goal
    write("Enter list:"), nl,
    readterm(list, L), nl,
    write("Enter X:"), nl,
    readint(X), nl,
    write("Enter Y:"), nl,
    readint(Y), nl,
    replace(L, X, Y, R),
    write('['),
    print(R),
    write("]."), nl,
    readchar(_).