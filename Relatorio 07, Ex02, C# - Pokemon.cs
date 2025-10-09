using System;
using System.Collections.Generic;

class Pokemon
{
    public string Nome { get; set; }

    public Pokemon(string nome)
    {
        Nome = nome;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{Nome} realiza um ataque generico!");
    }
}

class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lanca uma labareda de fogo!");
    }
}

class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lanca um jato de agua!");
    }
}

class Program
{
    static void Main()
    {
        List<Pokemon> pokemons = new List<Pokemon>();

        pokemons.Add(new PokemonDeFogo("Charizard"));
        pokemons.Add(new PokemonDeAgua("Blastoise"));

        foreach (Pokemon p in pokemons)
        {
            p.Atacar();
        }

        Console.ReadLine();
    }
}
