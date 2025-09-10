function maiorNumero(tabela)
    local maior = tabela[1] 
    for i = 2, #tabela do  
        if tabela[i] > maior then
            maior = tabela[i]
        end
    end
    return maior
end

io.write("Quantos números deseja inserir? ")
local qtd = tonumber(io.read())

local numeros = {}

for i = 1, qtd do
    io.write("Digite o número " .. i .. ": ")
    numeros[i] = tonumber(io.read())
end

print("\nO maior número da tabela é: " .. maiorNumero(numeros))
