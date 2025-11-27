pai(cronos, zeus).
pai(cronos, poseidon).
pai(cronos, hades).

mae(reia, zeus).
mae(reia, poseidon).
mae(reia, hades).


irmaos_germanos(A, B) :-
    pai(P, A), pai(P, B),
    mae(M, A), mae(M, B),
    A \= B.  
