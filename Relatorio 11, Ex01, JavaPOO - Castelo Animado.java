import java.util.ArrayList;

class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
}

class Mago extends Personagem {
    private String magia;

    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }

    public String getMagia() {
        return magia;
    }

    public void setMagia(String magia) {
        this.magia = magia;
    }

    public String lancarFeitico() {
        return getNome() + " lancou o feitico de " + magia + "!";
    }
}

class Divisao {
    private String nome;

    public Divisao(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}

class Castelo {
    private String nome;
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome) {
        this.nome = nome;
        this.divisoes = new ArrayList<>();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public ArrayList<Divisao> getDivisoes() {
        return divisoes;
    }

    public void adicionarDivisao(Divisao divisao) {
        divisoes.add(divisao);
    }
}

public class Main {
    public static void main(String[] args) {
        Castelo castelo = new Castelo("Castelo Movel de Howl");

        Divisao sala = new Divisao("Sala de Jantar");
        Divisao biblioteca = new Divisao("Biblioteca");
        castelo.adicionarDivisao(sala);
        castelo.adicionarDivisao(biblioteca);

        Mago howl = new Mago("Howl", 30, "Metamorfose");
        System.out.println(howl.lancarFeitico());

        System.out.println("Divisoes do castelo " + castelo.getNome() + ":");
        for (Divisao d : castelo.getDivisoes()) {
            System.out.println("- " + d.getNome());
        }
    }
}
