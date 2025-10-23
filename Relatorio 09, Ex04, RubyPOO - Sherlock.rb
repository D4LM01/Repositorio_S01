module Rastreavel
  def obter_localizacao(hora)
    "#{@nome} foi visto em #{@localizacao} às #{hora}."
  end
end

module Perigoso
  def calcular_risco
    rand(1..10) # retorna risco aleatório
  end
end

class Participante
  attr_accessor :nome, :localizacao

  def initialize(nome, localizacao = nil)
    @nome = nome
    @localizacao = localizacao
  end
end

class Detetive < Participante
  include Rastreavel
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso
end

class Cenario
  attr_accessor :participantes

  def initialize
    @participantes = []
  end

  def adicionar_participante(p)
    @participantes << p
  end

  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end
end

cenario = Cenario.new

print "Digite a localização de Sherlock: "
local_sherlock = gets&.chomp || "Baker Street"

print "Digite a localização de Moriarty: "
local_moriarty = gets&.chomp || "Londres"

sherlock = Detetive.new("Sherlock", local_sherlock)
moriarty = MestreDoCrime.new("Moriarty", local_moriarty)

cenario.adicionar_participante(sherlock)
cenario.adicionar_participante(moriarty)

ameacas = cenario.identificar_ameacas

puts "\n--- Relatório de Rastreamento ---"
cenario.participantes.each do |p|
  puts p.obter_localizacao("14:00") if p.respond_to?(:obter_localizacao)
end

puts "\n--- Ameaças Detectadas ---"
ameacas.each do |a|
  puts "#{a.nome} possui risco nível #{a.calcular_risco}!"
end
