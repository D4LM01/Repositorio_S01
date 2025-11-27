filho(hades, cronos).
filho(hades, reia).

filho(zeus, cronos).
filho(zeus, reia).

filho(poseidon, cronos).
filho(poseidon, reia).

% Domínios dos deuses
dominio(zeus, ceu).
dominio(poseidon, mar).
dominio(hades, submundo).

divindade_olimpica(Deus) :-
    filho(Deus, cronos),
    dominio(Deus, Dom),
    (Dom = ceu ; Dom = mar ; Dom = submundo).

