#include <iostream>
using namespace std;


class Pessoa {
protected:
    string nome;

public:
    Pessoa(string n) {
        nome = n;
    }


    virtual void apresentar() {
        cout << "Olá, meu nome é " << nome << " e eu sou uma pessoa." << endl;
    }

    virtual ~Pessoa() {} 
};


class Professor : public Pessoa {
private:
    string disciplina;

public:
    Professor(string n, string d) : Pessoa(n) {
        disciplina = d;
    }

    void apresentar() override {
        cout << "Olá, meu nome é " << nome 
             << " e eu sou um professor de " << disciplina << "." << endl;
    }
};


class Aluno : public Pessoa {
private:
    string curso;

public:
    Aluno(string n, string c) : Pessoa(n) {
        curso = c;
    }

    void apresentar() override {
        cout << "Olá, meu nome é " << nome 
             << " e eu sou um aluno de " << curso << "." << endl;
    }
};

int main() {

    Pessoa* p1 = new Professor("Carlos", "Matemática");
    Pessoa* p2 = new Aluno("Mariana", "Engenharia de Software");

    p1->apresentar();
    p2->apresentar();

    delete p1;
    delete p2;

    return 0;
}
