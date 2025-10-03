#include <iostream>
using namespace std;


class Pessoa {
private:
    string nome;
    int idade;

public:
    Pessoa(string n, int i) {
        nome = n;
        idade = i;
    }

    string getNome() {
        return nome;
    }

    int getIdade() {
        return idade;
    }
};


class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string n, int i, int nv) : Pessoa(n, i) {
        nivel = nv;
    }

    int getNivel() {
        return nivel;
    }
};


class Personagem : public Pessoa {
private:
    int rank; 

public:
    Personagem(string n, int i, int r) : Pessoa(n, i) {
        if (r < 0) r = 0;
        if (r > 10) r = 10;
        rank = r;
    }

    int getRank() {
        return rank;
    }
};

int main() {
	
    Protagonista p1("Ren Amamiya", 16, 5);

    Personagem p2("Ryuji Sakamoto", 16, 7);

    cout << "=== Informações do Protagonista ===" << endl;
    cout << "Nome: " << p1.getNome() << endl;
    cout << "Idade: " << p1.getIdade() << endl;
    cout << "Nivel: " << p1.getNivel() << endl;

    cout << "\n=== Informações do Aliado ===" << endl;
    cout << "Nome: " << p2.getNome() << endl;
    cout << "Idade: " << p2.getIdade() << endl;
    cout << "Rank (Social Link): " << p2.getRank() << endl;

    return 0;
}
