function calculadora(a, b, operador)
    if operador == "+" then
        return a + b
    elseif operador == "-" then
        return a - b
    elseif operador == "*" then
        return a * b
    elseif operador == "/" then
        if b ~= 0 then
            return a / b
        else
            return "Erro: divisão por zero!"
        end
    else
        return "Erro: operador inválido!"
    end
end

io.write("Digite o primeiro número: ")
local n1 = tonumber(io.read())

io.write("Digite o segundo número: ")
local n2 = tonumber(io.read())

io.write("Digite o operador (+, -, * ou /): ")
local op = io.read()

local resultado = calculadora(n1, n2, op)

print("Resultado: " .. resultado)
