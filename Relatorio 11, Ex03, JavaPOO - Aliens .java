import java.util.HashMap;

interface IRastreavel {
    String obterCoordenadas();
}

class Poder {
    private String nome;

    public Poder(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}

abstract class Entidade implements IRastreavel {
    private String nome;
    private String localizacao;
    private Poder poder;

    public Entidade(String nome, String localizacao, Poder poder) {
        this.nome = nome;
        this.localizacao = localizacao;
        this.poder = poder;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public Poder getPoder() {
        return poder;
    }

    public void setPoder(Poder poder) {
        this.poder = poder;
    }

    @Override
    public String obterCoordenadas() {
        return "Localizacao: " + localizacao;
    }
}

class Youkai extends Entidade {
    public Youkai(String nome, String localizacao, Poder poder) {
        super(nome, localizacao, poder);
    }

    @Override
    public String obterCoordenadas() {
        return "Youkai detectado em " + getLocalizacao() + " com poder: " + getPoder().getNome();
    }
}

class Alien extends Entidade {
    private String planetaOrigem;
    private String ovni;

    public Alien(String nome, String planetaOrigem, String ovni, Poder poder) {
        super(nome, "Espaco Aereo", poder);
        this.planetaOrigem = planetaOrigem;
        this.ovni = ovni;
    }

    public String getPlanetaOrigem() {
        return planetaOrigem;
    }

    public void setPlanetaOrigem(String planetaOrigem) {
        this.planetaOrigem = planetaOrigem;
    }

    public String getOvni() {
        return ovni;
    }

    public void setOvni(String ovni) {
        this.ovni = ovni;
    }

    @Override
    public String obterCoordenadas() {
        return "Alien vindo de " + planetaOrigem + " no " + ovni + ", poder: " + getPoder().getNome();
    }
}

class Registros {
    private String nomeEquipe;
    private HashMap<String, String> avistamentos;

    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(Entidade entidade, String nome) {
        if (!avistamentos.containsKey(nome)) {
            avistamentos.put(nome, entidade.obterCoordenadas());
            return true;
        }
        return false;
    }

    public void listarAvistamentos() {
        System.out.println("=== Avistamentos registrados pela equipe " + nomeEquipe + " ===");
        for (String nome : avistamentos.keySet()) {
            System.out.println(nome + " -> " + avistamentos.get(nome));
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Poder poder1 = new Poder("Telepatia");
        Poder poder2 = new Poder("Controle Espiritual");

        Alien alien = new Alien("Zorgon", "Marte", "Nave Fenix", poder1);
        Youkai youkai = new Youkai("Kitsune", "Montanha Sagrada", poder2);

        Registros registros = new Registros("Detetives Ocultos");

        registros.registrarAvistamento(alien, alien.getNome());
        registros.registrarAvistamento(youkai, youkai.getNome());
        registros.registrarAvistamento(alien, alien.getNome()); // duplicado, nao sera adicionado

        registros.listarAvistamentos();
    }
}
