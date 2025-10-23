# Classe MicroondasUnidade (Composição)
class MicroondasUnidade
  def aquecer_por(segundos)
    puts "Aquecendo por #{segundos} segundos..."
  end
end

class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "D-Mail enviado às #{@hora_envio}: #{@conteudo}"
  end
end

class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new # composição
    @dmails = [] # agregação
  end

  # Método para envio de D-Mail
  def enviar_dmail
    print "\nDigite o conteúdo do D-Mail: "
    conteudo = gets
    conteudo = conteudo ? conteudo.chomp : "Mensagem padrão"

    print "Digite a hora de envio (ex: 10:30): "
    hora_envio = gets
    hora_envio = hora_envio ? hora_envio.chomp : "00:00"

    @unidade.aquecer_por(5)

    dmail = DMail.new(conteudo, hora_envio)
    @dmails << dmail

    puts "\n D-Mail enviado com sucesso!"
  end

  def listar_dmails(horario_corte)
    puts "\n D-Mails enviados após #{horario_corte}:"
    enviados = @dmails.select { |d| d.hora_envio > horario_corte }

    if enviados.empty?
      puts "Nenhum D-Mail encontrado após #{horario_corte}."
    else
      enviados.each { |d| puts d.to_s }
    end
  end
end

telefone = TelefoneDeMicroondas.new

loop do
  puts "\n=== MENU D-MAIL ==="
  puts "1. Enviar D-Mail"
  puts "2. Listar D-Mails após horário"
  puts "3. Sair"
  print "Escolha uma opção: "

  opcao = gets
  opcao = opcao ? opcao.chomp : "3"

  case opcao
  when "1"
    telefone.enviar_dmail
  when "2"
    print "\nDigite o horário de corte (ex: 09:00): "
    horario_corte = gets
    horario_corte = horario_corte ? horario_corte.chomp : "00:00"
    telefone.listar_dmails(horario_corte)
  when "3"
    puts "\nEncerrando programa..."
    break
  else
    puts "Opção inválida"
  end
end
