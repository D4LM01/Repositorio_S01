habita(zeus, olimpo).
habita(hera, olimpo).
habita(poseidon, oceano).
habita(hades, submundo).

dominio(zeus, ceu).
dominio(zeus, relampago).

dominio(hera, casamento).
dominio(hera, familia).

dominio(poseidon, mar).

dominio(hades, submundo).

deus_maior(Deus) :-
    habita(Deus, olimpo),
    dominio(Deus, D1),
    dominio(Deus, D2),
    D1 \= D2.   
