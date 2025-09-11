package main

import (
	"fmt"
)

// Função que gera a sequência de Fibonacci
func fibonacci(n int) {
	a, b := 0, 1
	for i := 0; i < n; i++ {
		fmt.Print(a, " ")
		a, b = b, a+b
	}
	fmt.Println()
}

func main() {
	var num int

	// Pede ao usuário a quantidade de termos
	fmt.Print("Digite quantos números da sequência de Fibonacci deseja: ")
	fmt.Scan(&num)

	// Chama a função fibonacci
	fibonacci(num)
}
