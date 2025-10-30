class Pokemon {
  #vida;

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) this.#vida = 0;
    console.log(`${this.nome} recebeu ${dano} de dano. Vida atual: ${this.#vida}`);
  }

  atacar(alvo) {
    console.log(`${this.nome} ataca genericamente ${alvo.nome}, causando 10 de dano.`);
    alvo.receberDano(10);
  }
}

class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonusAtaque;
  }

  atacar(alvo) {
    const dano = 15 + this.bonusAtaque;
    console.log(`${this.nome} lança uma labareda! Causa ${dano} de dano em ${alvo.nome}.`);
    alvo.receberDano(dano);
  }
}

class PokemonAgua extends Pokemon {
  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Agua", vidaInicial);
    this.curaBase = curaBase;
  }

  atacar(alvo) {
    const dano = 12;
    console.log(`${this.nome} usa Jato d'Agua! Causa ${dano} de dano em ${alvo.nome}.`);
    alvo.receberDano(dano);

    console.log(`${this.nome} se cura em ${this.curaBase} pontos de vida.`);
    this.#curar(this.curaBase);
  }

  #curar(valor) {
    const vidaAtual = this.getVida();
    const novaVida = vidaAtual + valor;
    console.log(`Vida de ${this.nome} aumentou para ${novaVida}`);
    const temp = { set: (v) => v };
    temp.set(novaVida);
  }
}

const charmander = new PokemonFogo("Charmander", 100, 5);
const squirtle = new PokemonAgua("Squirtle", 100, 8);

console.log("\n--- Inicio da Batalha ---");
charmander.atacar(squirtle);
squirtle.atacar(charmander);
console.log("\n--- Fim da Batalha ---");
