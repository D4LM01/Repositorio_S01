import java.util.HashMap;
import java.util.LinkedHashSet;

class PadraoAtaque {
    private String nome;
    private int dano;

    public PadraoAtaque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }

    public String getNome() {
        return nome;
    }

    public int getDano() {
        return dano;
    }

    @Override
    public String toString() {
        return nome + " (Dano: " + dano + ")";
    }
}

class Boss {
    private String nome;
    private String idBoss;
    private String pontoFraco;
    private LinkedHashSet<PadraoAtaque> moveset;

    public Boss(String nome, String idBoss, String pontoFraco) {
        this.nome = nome;
        this.idBoss = idBoss;
        this.pontoFraco = pontoFraco;
        this.moveset = new LinkedHashSet<>();
    }

    public String getNome() {
        return nome;
    }

    public String getIdBoss() {
        return idBoss;
    }

    public String getPontoFraco() {
        return pontoFraco;
    }

    public void adicionarAtaque(PadraoAtaque ataque) {
        moveset.add(ataque);
    }

    public void iniciarFase() {
        System.out.println("Iniciando fase contra o boss: " + nome);
        System.out.println("Ponto fraco: " + pontoFraco);
        System.out.println("Ataques:");
        for (PadraoAtaque a : moveset) {
            System.out.println("- " + a);
        }
    }
}

class BossMagico extends Boss {

    public BossMagico(String nome, String idBoss, String pontoFraco) {
        super(nome, idBoss, pontoFraco);
    }

    @Override
    public void iniciarFase() {
        System.out.println("Um campo magico envolve o boss!");
        super.iniciarFase();
    }
}

class Batalha {
    private HashMap<String, Boss> arena;

    public Batalha() {
        this.arena = new HashMap<>();
    }

    public void adicionarBoss(Boss boss) {
        arena.put(boss.getIdBoss(), boss);
    }

    public void iniciarBatalha(String idBoss) {
        Boss boss = arena.get(idBoss);
        if (boss != null) {
            boss.iniciarFase();
        } else {
            System.out.println("Boss com ID " + idBoss + " nao encontrado na arena.");
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Batalha batalha = new Batalha();

        Boss boss1 = new Boss("Golem de Pedra", "B001", "Agua");
        boss1.adicionarAtaque(new PadraoAtaque("Soco de Pedra", 20));
        boss1.adicionarAtaque(new PadraoAtaque("Terremoto", 35));

        BossMagico boss2 = new BossMagico("Mago das Sombras", "B002", "Luz");
        boss2.adicionarAtaque(new PadraoAtaque("Bola Sombria", 25));
        boss2.adicionarAtaque(new PadraoAtaque("Explosao Magica", 40));

        batalha.adicionarBoss(boss1);
        batalha.adicionarBoss(boss2);

        batalha.iniciarBatalha("B001");
        System.out.println();
        batalha.iniciarBatalha("B002");
        System.out.println();
        batalha.iniciarBatalha("B003");
    }
}
