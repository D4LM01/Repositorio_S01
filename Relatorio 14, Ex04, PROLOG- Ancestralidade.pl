pai(urano, cronos).
pai(cronos, zeus).
pai(cronos, poseidon).
pai(cronos, hades).

mae(gaia, cronos).
mae(reia, zeus).
mae(reia, poseidon).
mae(reia, hades).

progenitor(A, B) :- pai(A, B).
progenitor(A, B) :- mae(A, B).

ancestral(A, D) :-
    progenitor(A, D).

ancestral(A, D) :-
    progenitor(A, Z),
    ancestral(Z, D).
