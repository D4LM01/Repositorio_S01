class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "O método tocar_partitura deve ser implementado nas subclasses!"
  end
end

class Pianista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} está tocando '#{peca}' com o piano"
  end
end

class Violinista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} executa '#{peca}' no violino"
  end
end

class Maestro
  def initialize(nome, musicos)
    @nome = nome
    @musicos = musicos
  end

  def iniciar_ensaio(peca)
    puts "\n Maestro #{@nome} inicia o ensaio da peça '#{peca}'\n\n"
    @musicos.each { |m| m.tocar_partitura(peca) }
  end

  def mudar_foco(estado)
    puts "\nMudando foco dos músicos para: #{estado}...\n\n"
    mensagens = @musicos.map do |m|
      "#{m.nome} agora está #{estado}!"
    end
    mensagens.each { |msg| puts msg }
  end
end

def safe_input(prompt)
  print prompt
  entrada = gets
  entrada ? entrada.chomp : ""
end

# Criação dos músicos
m1 = Pianista.new("Alice", "Piano")
m2 = Violinista.new("Bruno", "Violino")
m3 = Pianista.new("Carla", "Piano")

maestro = Maestro.new("Kousei", [m1, m2, m3])

peca = safe_input("\nDigite o nome da peça a ser tocada no ensaio: ")
if peca.empty?
  puts "\nNenhuma entrada detectada — usando 'Clair de Lune' como padrão."
  peca = "Clair de Lune"
end

maestro.mudar_foco("Concentrado")
maestro.iniciar_ensaio(peca)
