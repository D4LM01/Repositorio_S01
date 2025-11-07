import java.util.ArrayList;

class Cafe {
    private String nome;
    private double precoBase;

    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPrecoBase() {
        return precoBase;
    }

    public void setPrecoBase(double precoBase) {
        this.precoBase = precoBase;
    }

    public double calcularPrecoFinal() {
        return precoBase;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double precoBase, double bonusAroma) {
        super(nome, precoBase);
        this.bonusAroma = bonusAroma;
    }

    public double getBonusAroma() {
        return bonusAroma;
    }

    public void setBonusAroma(double bonusAroma) {
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return getPrecoBase() + bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> itens;

    public Menu() {
        this.itens = new ArrayList<>();
    }

    public ArrayList<Cafe> getItens() {
        return itens;
    }

    public void adicionarItem(Cafe cafe) {
        itens.add(cafe);
    }

    public void exibirMenu() {
        System.out.println("Menu de Cafes Disponiveis:");
        for (Cafe c : itens) {
            System.out.println("- " + c.getNome() + " | Preco final: R$ " + c.calcularPrecoFinal());
        }
    }
}

class CafeLeblanc {
    private Menu menu;

    public CafeLeblanc(Menu menu) {
        this.menu = menu;
    }

    public void receberPedido(Cafe cafe) {
        System.out.println("Pedido recebido: " + cafe.getNome() + " | Total: R$ " + cafe.calcularPrecoFinal());
    }

    public void exibirMenu() {
        menu.exibirMenu();
    }
}

public class Main {
    public static void main(String[] args) {
        Menu menu = new Menu();

        Cafe expresso = new Cafe("Expresso", 5.0);
        CafeGourmet cappuccino = new CafeGourmet("Cappuccino Gourmet", 6.0, 2.0);

        menu.adicionarItem(expresso);
        menu.adicionarItem(cappuccino);

        CafeLeblanc cafeteria = new CafeLeblanc(menu);

        cafeteria.exibirMenu();
        cafeteria.receberPedido(cappuccino);
    }
}
