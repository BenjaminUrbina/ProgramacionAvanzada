% Definición de relaciones familiares
padre(juan, maria).
padre(juan, jose).
padre(carlos, ana).
madre(marta, maria).
madre(marta, jose).
madre(sara, ana).

% Regla para determinar si alguien es hermano o hermana
hermano(X, Y) :-
    padre(P, X), padre(P, Y),
    madre(M, X), madre(M, Y),
    X \= Y.
