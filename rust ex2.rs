use std::io;

fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    // Jogador 1 escolhe par ou ímpar
    println!("Jogador 1, escolha 'par' ou 'ímpar':");

    let mut escolha = String::new();
    io::stdin()
        .read_line(&mut escolha)
        .expect("Erro ao ler entrada");
    let escolha = escolha.trim().to_lowercase();

    // Jogador 1 escolhe o número
    println!("Jogador 1, digite seu número (i32):");
    let mut num1 = String::new();
    io::stdin().read_line(&mut num1).expect("Erro ao ler número");
    let num1: i32 = num1.trim().parse().expect("Digite um número válido!");

    // Jogador 2 escolhe o número
    println!("Jogador 2, digite seu número (i32):");
    let mut num2 = String::new();
    io::stdin().read_line(&mut num2).expect("Erro ao ler número");
    let num2: i32 = num2.trim().parse().expect("Digite um número válido!");

    // Calcula a soma
    let soma = num1 + num2;

    // Verifica se a soma é par
    let resultado_par = eh_par(soma);

    // Determina o vencedor
    let vencedor = if (resultado_par && escolha == "par") || (!resultado_par && escolha == "ímpar") {
        "Jogador 1"
    } else {
        "Jogador 2"
    };

    // Mostra o resultado
    println!(
        "A soma foi {} ({}). {} venceu!",
        soma,
        if resultado_par { "par" } else { "ímpar" },
        vencedor
    );
}
