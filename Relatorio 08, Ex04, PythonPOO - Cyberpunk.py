from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, custo: int, funcao: str):
        self.custo = custo
        self.funcao = funcao

    def __str__(self):
        return f"Implante ({self.funcao}, custo: {self.custo} créditos)"


class NetRunner(Cibernetico):
    def __init__(self, nome: str, custo_implante: int, funcao_implante: str):
        self.nome = nome
        self.implante = Implante(custo_implante, funcao_implante)

    def realizar_hack(self):
        print(f"{self.nome} está realizando um hack usando {self.implante.funcao}!")


class Faccao:
    def __init__(self, nome: str, membros: list[Cibernetico]):
        self.nome = nome
        self.membros = membros  

    def executar_hacks(self):
        print(f"\nFacção {self.nome} iniciando operação de hack coletivo...")
        for membro in self.membros:
            membro.realizar_hack()


if __name__ == "__main__":
    runner1 = NetRunner("V", 5000, "Overclock Neural")
    runner2 = NetRunner("Lucy", 7000, "Invasão de Rede")
    runner3 = NetRunner("T-Bug", 6500, "Controle de Drones")

    faccao = Faccao("Afterlife Hackers", [runner1, runner2, runner3])

    faccao.executar_hacks()
