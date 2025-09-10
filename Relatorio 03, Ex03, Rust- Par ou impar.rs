use std::io;

fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior {
        println!("{} x {} = {}", numero, i, numero * i);
    }
}

fn main() {
    // Número da tabuada
    println!("Digite o número da tabuada:");
    let mut entrada = String::new();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler entrada");
    let numero: i32 = entrada.trim().parse().expect("Digite um número válido");

    // Limite inferior
    println!("Digite o limite inferior:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler entrada");
    let limite_inferior: i32 = entrada.trim().parse().expect("Digite um número válido");

    // Limite superior
    println!("Digite o limite superior:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler entrada");
    let limite_superior: i32 = entrada.trim().parse().expect("Digite um número válido");

    if limite_inferior > limite_superior {
        println!("Erro: o limite inferior não pode ser maior que o limite superior.");
    } else {
        imprimir_tabuada(numero, limite_inferior, limite_superior);
    }
}
