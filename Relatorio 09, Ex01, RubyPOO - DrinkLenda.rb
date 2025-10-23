class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @nome = nome
    self.preco_base = preco_base
  end

  def preco_base
    @_preco_base
  end

  def preco_base=(valor)
    if valor > 0
      @_preco_base = valor
    else
      raise "O preço deve ser positivo!"
    end
  end

  def preco_final
    @_preco_base
  end

  def to_s
    "Drink: #{@nome}, Preço base: $#{@_preco_base}"
  end
end

class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  def preco_final
    @_preco_base + (5 * @anos_desde_criacao)
  end

  def to_s
    "Drink Lenda: #{@nome}, Preço base: $#{@_preco_base}, Anos: #{@anos_desde_criacao}, Preço final: $#{preco_final}"
  end
end

def safe_input(prompt)
  print prompt
  entrada = gets
  entrada ? entrada.chomp : "" 
end

nome = safe_input("Digite o nome do drink: ")
if nome.empty?
  puts "\nNenhuma entrada detectada — usando valores de teste..."
  nome = "AfterLife Special"
  preco_base = 20.0
  anos = 3
else
  preco_base = safe_input("Digite o preço base: ").to_f
  anos = safe_input("Digite os anos desde a criação (0 se for um drink comum): ").to_i
end

if anos > 0
  drink = DrinkLenda.new(nome, preco_base, anos)
else
  drink = Drink.new(nome, preco_base)
end

puts "\n=== Resultado ==="
puts drink.to_s
puts "Preço final: $#{drink.preco_final}"
