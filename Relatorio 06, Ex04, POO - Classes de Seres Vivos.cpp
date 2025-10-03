#include <iostream>
#include <vector>
using namespace std;


class SerVivo {
protected:
    string nome;

public:
    SerVivo(string n) : nome(n) {}

 
    virtual void apresentar() {
        cout << "Ol�, eu sou um ser vivo chamado " << nome << "." << endl;
    }

    virtual ~SerVivo() {} 
};


class Humano : public SerVivo {
public:
    Humano(string n) : SerVivo(n) {}

    void apresentar() override {
        cout << "Ol�, meu nome � " << nome << " e eu sou um Humano." << endl;
    }
};


class Elfo : public SerVivo {
public:
    Elfo(string n) : SerVivo(n) {}

    void apresentar() override {
        cout << "Sauda��es, eu sou " << nome << ", um Elfo da floresta." << endl;
    }
};


class Fada : public SerVivo {
public:
    Fada(string n) : SerVivo(n) {}

    void apresentar() override {
        cout << "Ol�, eu sou a fada " << nome << " e trago magia ao mundo!" << endl;
    }
};

int main() {

    vector<SerVivo*> seres;


    seres.push_back(new Humano("Arthur"));
    seres.push_back(new Elfo("Legolas"));
    seres.push_back(new Fada("Tinker Bell"));

	
    for (SerVivo* s : seres) {
        s->apresentar();
    }


    for (SerVivo* s : seres) {
        delete s;
    }

    return 0;
}
