#include <iostream>
using namespace std;

int main() {
    int quantidade;
    cout << "Quantas notas deseja inserir? ";
    cin >> quantidade;

    float nota, soma = 0;
    int i = 0;

    for (int j = 0; j < quantidade; j++) {
        cout << "Digite a nota " << j + 1 << ": ";
        cin >> nota;

        // validação
        while (nota < 0 || nota > 10) {
            cout << "Nota invalida! Digite novamente (0 a 10): ";
            cin >> nota;
        }

        soma += nota;
        i++;
    }

    float media = soma / i;

    cout << "Media final = " << media << endl;

    if (media >= 7)
        cout << "Aprovado" << endl;
    else
        cout << "Reprovado" << endl;

    return 0;
}
