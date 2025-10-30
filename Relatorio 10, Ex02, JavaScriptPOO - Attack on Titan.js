class IExplorador {
  explorarTerritorio() {
    throw new Error("Método 'explorarTerritorio()' deve ser implementado.");
  }
}

class ODM_Gear {
  constructor(modelo) {
    this.modelo = modelo;
    this.gasRestante = 100; 
  }

  usarGas(quantidade) {
    this.gasRestante -= quantidade;
    if (this.gasRestante < 0) this.gasRestante = 0;
    console.log(`[ODM] ${this.modelo}: usando ${quantidade}% de gas... Restante: ${this.gasRestante}%`);
  }

  getGas() {
    return this.gasRestante;
  }
}

class Soldado extends IExplorador {
  constructor(nome, modeloGear) {
    super();
    this.nome = nome;
    this.gear = new ODM_Gear(modeloGear);
  }

  explorarTerritorio() {
    this.gear.usarGas(15);
    return `${this.nome} esta explorando o território com o ODM ${this.gear.modelo}.`;
  }

  verificarEquipamento() {
    return `Soldado ${this.nome} possui ${this.gear.modelo} com ${this.gear.getGas()}% de gas restante.`;
  }
}

class Esquadrao extends IExplorador {
  constructor(lider, membrosIniciais = []) {
    super();
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    this.membros.push(soldado);
    console.log(`Novo membro adicionado ao esquadrão: ${soldado.nome}`);
  }

  explorarTerritorio() {
    console.log(`Esquadrão liderado por ${this.lider.nome} iniciou a exploração!\n`);
    return this.membros.map((m) => m.explorarTerritorio());
  }

  relatarStatus() {
    return this.membros.map((m) => m.verificarEquipamento());
  }
}

const levi = new Soldado("Capitão Levi", "ODM-Gear MKIII");
const mikasa = new Soldado("Mikasa Ackerman", "ODM-Gear MKII");
const armin = new Soldado("Armin Arlert", "ODM-Gear MKI");

const esquadraoLevi = new Esquadrao(levi, [mikasa, armin]);

console.log("\n--- INÍCIO DA MISSÃO ---");
const relatorioExploracao = esquadraoLevi.explorarTerritorio();
console.log(relatorioExploracao.join("\n"));

console.log("\n--- STATUS DOS SOLDADOS ---");
console.log(esquadraoLevi.relatarStatus().join("\n"));
