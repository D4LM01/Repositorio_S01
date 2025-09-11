package main

import (
	"fmt"
)

// Função que classifica o número
func classificar_numero(num int) string {
	if num > 0 {
		return "Positivo"
	} else if num < 0 {
		return "Negativo"
	} else {
		return "Zero"
	}
}

func main() {
	var numero int

	// Solicita ao usuário um número
	fmt.Print("Digite um número inteiro: ")
	fmt.Scan(&numero)

	// Exibe o resultado da classificação
	resultado := classificar_numero(numero)
	fmt.Println("O número é:", resultado)
}
