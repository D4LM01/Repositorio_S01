class ArmaCorpoACorpo:
    def __init__(self, nome: str):
        self.nome = nome

    def __str__(self):
        return f"Arma corpo a corpo: {self.nome}"


class PhantomThieves:
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} empunha {self.arma}"


class Joker:
    def __init__(self, equipe: list[PhantomThieves]):
        self.arma = ArmaCorpoACorpo("Faca")
        self.equipe = equipe

    def mostrar_equipe(self):
        print(f"Joker luta com sua {self.arma.nome}.")
        print("Membros da equipe Phantom Thieves:")
        for membro in self.equipe:
            print(f" - {membro.nome} com {membro.arma}")


if __name__ == "__main__":
    morgana = PhantomThieves("Morgana", "Estilingue")
    ryuji = PhantomThieves("Ryuji", "Cajado")
    ann = PhantomThieves("Ann", "Chicote")

    equipe = [morgana, ryuji, ann]
    joker = Joker(equipe)

    joker.mostrar_equipe()
