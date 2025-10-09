using System;
using System.Collections.Generic;

class Feitico
{
    public string Nome { get; set; }

    public Feitico(string nome)
    {
        Nome = nome;
    }
}

class Grimorio
{
    private List<Feitico> feiticos;

    public Grimorio()
    {
        feiticos = new List<Feitico>();
    }

    public void AdicionarFeitico(Feitico f)
    {
        feiticos.Add(f);
    }

    public void ListarFeiticos()
    {
        Console.WriteLine("Feiticos do Grimorio:");
        foreach (Feitico f in feiticos)
        {
            Console.WriteLine($"- {f.Nome}");
        }
    }
}

class Ferramenta
{
    public string Nome { get; set; }

    public Ferramenta(string nome)
    {
        Nome = nome;
    }
}

class Maga
{
    public string Nome { get; set; }
    public Grimorio Grimorio { get; private set; } 
    public List<Ferramenta> Ferramentas { get; set; } 

    public Maga(string nome, List<Ferramenta> ferramentas)
    {
        Nome = nome;
        Grimorio = new Grimorio(); 
        Ferramentas = ferramentas; 
    }

    public void MostrarFerramentas()
    {
        Console.WriteLine($"{Nome} possui as seguintes ferramentas:");
        foreach (var f in Ferramentas)
        {
            Console.WriteLine($"- {f.Nome}");
        }
    }
}

// Programa principal
class Program
{
    static void Main()
    {
        List<Ferramenta> ferramentas = new List<Ferramenta>
        {
            new Ferramenta("Capacete"),
            new Ferramenta("Lanterna"),
            new Ferramenta("Mapa Mágico")
        };

        Maga frieren = new Maga("Frieren", ferramentas);

        frieren.Grimorio.AdicionarFeitico(new Feitico("Raio Arcano"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Barreira de Gelo"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Luz Sagrada"));

        frieren.Grimorio.ListarFeiticos();
        Console.WriteLine();
        frieren.MostrarFerramentas();

        Console.ReadLine();
    }
}
