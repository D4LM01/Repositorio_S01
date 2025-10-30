class IRastreavel {
  rastrearLocal(latitude, longitude) {
    throw new Error("Metodo 'rastrearLocal()' deve ser implementado.");
  }
}

class Hunter extends IRastreavel {
  constructor(nome, local, idade) {
    super();
    this.nome = nome;
    this.localizacao = local;
    this.idade = idade;
  }

  getNome() {
    return this.nome;
  }
}

class Especialista extends Hunter {
  constructor(nome, local, idade, habilidadeNen) {
    super(nome, local, idade);
    this.habilidadeNen = habilidadeNen;
  }

  rastrearLocal(latitude, longitude) {
    return `Especialista ${this.nome} rastreou (${latitude}, ${longitude}) usando ${this.habilidadeNen}.`;
  }
}

class Manipulador extends Hunter {
  constructor(nome, local, idade, alvoAtual) {
    super(nome, local, idade);
    this.alvoAtual = alvoAtual;
  }

  rastrearLocal(latitude, longitude) {
    const alvo = this.alvoAtual ? this.alvoAtual.getNome() : "sem alvo definido";
    return `Manipulador ${this.nome} rastreou (${latitude}, ${longitude}) focando no alvo ${alvo}.`;
  }
}

class Batalhao {
  constructor() {
    this.hunters = new Set();
  }

  adicionarHunter(hunter) {
    for (let h of this.hunters) {
      if (h.getNome() === hunter.getNome()) {
        console.log(`Hunter ${hunter.getNome()} ja esta no batalhao.`);
        return;
      }
    }
    this.hunters.add(hunter);
    console.log(`Hunter ${hunter.getNome()} adicionado ao batalhao.`);
  }

  getNumHunters() {
    return this.hunters.size;
  }

  iniciarRastreamento(latitude, longitude) {
    console.log(`Rastreamento iniciado em (${latitude}, ${longitude})`);
    const logs = [];
    for (let hunter of this.hunters) {
      logs.push(hunter.rastrearLocal(latitude, longitude));
    }
    return logs;
  }
}

const gon = new Especialista("Gon", "Floresta", 12, "Jajanken");
const kurapika = new Especialista("Kurapika", "Yorknew", 17, "Correntes de Julgamento");
const hisoka = new Manipulador("Hisoka", "Arena Celestial", 28, gon);

const batalhao = new Batalhao();
batalhao.adicionarHunter(gon);
batalhao.adicionarHunter(kurapika);
batalhao.adicionarHunter(hisoka);
batalhao.adicionarHunter(gon);

console.log(`Total de Hunters: ${batalhao.getNumHunters()}`);

const relatorio = batalhao.iniciarRastreamento("35°N", "139°E");
console.log(relatorio.join("\n"));
