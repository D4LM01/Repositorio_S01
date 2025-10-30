class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

class Diario {
  #autorSecreto;

  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map();
    this.criaturasAvisitadas = [];
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
  }

  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) {
      return "Acesso negado! Você não e o autor secreto!";
    }
    if (!this.enigmas.has(num)) {
      return "Enigma inexistente!";
    }
    const enigma = this.enigmas.get(num);
    return `Enigma ${num} decodificado: ${enigma}`;
  }

  adicionarCriatura(criatura) {
    this.criaturasAvisitadas.push(criatura);
  }
}

class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

class Protagonista extends Personagem {
  constructor(nome, idade, autor) {
    super(nome, idade);
    this.diario = new Diario(autor);
  }
}

class CabanaMisterio {
  constructor(diario) {
    this.diario = diario;
    this.visitantes = [];
    this.funcionarios = [];
  }

  adicionarFuncionario(personagem) {
    this.funcionarios.push(personagem);
  }

  listarFuncionarios() {
    return this.funcionarios;
  }
}

const dipper = new Protagonista("Dipper Pines", 12, "Dipper");
dipper.diario.adicionarEnigma(1, "O segredo está no porão.");
dipper.diario.adicionarEnigma(2, "O livro 2 está com Stan.");

console.log(dipper.diario.decodificar("Soos", 1));
console.log(dipper.diario.decodificar("Dipper", 2));

const gnomos = new Criatura("Gnomos", true);
const unicornio = new Criatura("Unicórnio", false);
dipper.diario.adicionarCriatura(gnomos);
dipper.diario.adicionarCriatura(unicornio);

const soos = new Personagem("Soos", 22);
const wendy = new Personagem("Wendy", 17);
const cabana = new CabanaMisterio(dipper.diario);
cabana.adicionarFuncionario(soos);
cabana.adicionarFuncionario(wendy);

console.log("\nFuncionários da Cabana Misterio:");
cabana.listarFuncionarios().forEach(f => console.log(`- ${f.nome}, ${f.idade} anos`));
