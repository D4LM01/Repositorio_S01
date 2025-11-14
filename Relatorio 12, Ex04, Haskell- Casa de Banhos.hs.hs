data Status = EmAndamento | Finalizado | Cancelado
    deriving Show

data Servico = Servico {
    nomeServico :: String,
    tipoServico :: String,
    precoBase   :: Double
} deriving Show

data Atendimento = Atendimento {
    servicos :: [Servico],
    statusAtendimento :: Status
} deriving Show

bonusEspiritual :: [Servico] -> Double
bonusEspiritual lista =
    let total = sum (map precoBase lista)
        mais3 = if length lista > 3 then total * 0.25 else 0
        desconto = if total > 500 then total * 0.10 else 0
    in total + mais3 - desconto

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento _ Cancelado) = 0
valorFinalAtendimento (Atendimento lista _) =
    bonusEspiritual lista

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico (Atendimento [] _) = "Nenhum serviço registrado."
descricaoPrimeiroServico (Atendimento (s:_) _) =
    "Primeiro servico: " ++ nomeServico s ++ " (" ++ tipoServico s ++ ")"

main :: IO ()
main = do
    let s1 = Servico "Banho Sagrado" "Banho" 200
    let s2 = Servico "Massagem Espiritual" "Massagem" 180
    let s3 = Servico "Banquete Divino" "Banquete" 250
    let s4 = Servico "Purificacao Suprema" "Banho" 300

    let atendimento1 = Atendimento [s1, s2] EmAndamento
    let atendimento2 = Atendimento [s1, s2, s3, s4] Finalizado
    let atendimento3 = Atendimento [s3, s4] Cancelado

    putStrLn " Atendimento 1 "
    print atendimento1
    putStrLn (descricaoPrimeiroServico atendimento1)
    putStrLn ("Valor final: " ++ show (valorFinalAtendimento atendimento1))

    putStrLn "\n Atendimento 2 "
    print atendimento2
    putStrLn (descricaoPrimeiroServico atendimento2)
    putStrLn ("Valor final: " ++ show (valorFinalAtendimento atendimento2))

    putStrLn "\n Atendimento 3 "
    print atendimento3
    putStrLn (descricaoPrimeiroServico atendimento3)
    putStrLn ("Valor final: " ++ show (valorFinalAtendimento atendimento3))
