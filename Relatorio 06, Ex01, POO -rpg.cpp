#include <iostream>
using namespace std;

class Personagem {
public:
    string nome;
    int nivel;
    int dano;
    int vida;

 
    Personagem(string n, int nv, int d, int v) {
        nome = n;
        nivel = nv;
        dano = d;
        vida = v;
    }

  
    void atacar(Personagem &alvo) {
        cout << nome << " atacou " << alvo.nome 
             << " causando " << dano << " de dano!" << endl;
        alvo.vida -= dano;
        if (alvo.vida < 0) alvo.vida = 0;
    }


    void mostrarInfo() {
        cout << "Nome: " << nome 
             << " | Nivel: " << nivel 
             << " | Dano: " << dano 
             << " | Vida: " << vida << endl;
    }
};

int main() {
    
    Personagem p1("Guerreiro", 5, 20, 100);
    Personagem p2("Mago", 4, 25, 80);

    cout << "=== Antes da batalha ===" << endl;
    p1.mostrarInfo();
    p2.mostrarInfo();

    cout << "\n=== Combate ===" << endl;
    p1.atacar(p2); 
    p2.atacar(p1); 

    cout << "\n=== Depois da batalha ===" << endl;
    p1.mostrarInfo();
    p2.mostrarInfo();

    return 0;
}
