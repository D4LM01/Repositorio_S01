using System;

abstract class MonstroSombrio
{
    public string Nome { get; set; }

    public MonstroSombrio(string nome)
    {
        Nome = nome;
    }

    public virtual void Mover()
    {
        Console.WriteLine($"{Nome} esta se movendo na escuridao...");
    }
}

class Zumbi : MonstroSombrio
{
    public Zumbi(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} (Zumbi) anda lentamente arrastando os pes...");
    }
}


class Espectro : MonstroSombrio
{
    public Espectro(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} (Espectro) desliza rapidamente atraves das paredes!");
    }
}

class Program
{
    static void Main()
    {
        MonstroSombrio[] monstros = new MonstroSombrio[3];
        monstros[0] = new Zumbi("Zumbi Lento");
        monstros[1] = new Espectro("Espectro Rapido");
        monstros[2] = new Zumbi("Zumbi Apodrecido");

        foreach (MonstroSombrio m in monstros)
        {
            m.Mover();
        }

        Console.ReadLine();
    }
}
