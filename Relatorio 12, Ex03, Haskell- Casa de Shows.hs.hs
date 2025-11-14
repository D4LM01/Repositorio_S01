data Status = Ativo | Encerrado | Cancelado
    deriving Show

data Banda = Banda {
    nomeBanda :: String,
    genero    :: String,
    cache     :: Double
} deriving Show

data Evento = Evento {
    bandas :: [Banda],
    status :: Status
} deriving Show

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ Cancelado) = 0
custoTotalEvento (Evento lista _) =
    let total = sum (map cache lista)
        taxa  = total * 0.20
    in total + taxa

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Nenhuma banda para abrir o evento."
bandaAbertura (Evento (b:_) _) = "Banda de abertura: " ++ nomeBanda b

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda para encerrar a noite."
bandaEncerramento (Evento lista _) =
    "Banda de encerramento: " ++ nomeBanda (last lista)

main :: IO ()
main = do
    let b1 = Banda "The Kokiris" "Folk" 5000
    let b2 = Banda "Goron Metal" "Metal" 7000
    let b3 = Banda "Zora Waves" "Synthwave" 6000
    let b4 = Banda "Hylian Knights" "Rock" 9000

    let eventoAtivo = Evento [b1, b2, b3] Ativo
    let eventoEncerrado = Evento [b2, b4] Encerrado
    let eventoCancelado = Evento [b1, b3, b4] Cancelado

    putStrLn " EVENTO ATIVO "
    print eventoAtivo
    putStrLn (bandaAbertura eventoAtivo)
    putStrLn (bandaEncerramento eventoAtivo)
    putStrLn ("Custo total: " ++ show (custoTotalEvento eventoAtivo))

    putStrLn "\n EVENTO ENCERRADO "
    print eventoEncerrado
    putStrLn (bandaAbertura eventoEncerrado)
    putStrLn (bandaEncerramento eventoEncerrado)
    putStrLn ("Custo total: " ++ show (custoTotalEvento eventoEncerrado))

    putStrLn "\n EVENTO CANCELADO "
    print eventoCancelado
    putStrLn (bandaAbertura eventoCancelado)
    putStrLn (bandaEncerramento eventoCancelado)
    putStrLn ("Custo total: " ++ show (custoTotalEvento eventoCancelado))
